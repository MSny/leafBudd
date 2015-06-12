module SessionsHelper

  #Log in the given user. Creates a temporary cookie for the user... This actually encrypts the user's ID.Temp encrypted user ID key...
  def log_in(user)
    #sets a param called user_id to the user's ID...
    session[:user_id] = user.id
  end
  
  #remember function used in many places for persistence of a cookie
  def remember(user)
    #generates a cookie that will last for 20 years in the browser
    #signed means that we are remembering the BCRypted version of the cookie.
    user.remember
    # cookies[:user_id]= {value: user.id, expires: 20.years.from_now.utc }
    cookies.permanent.signed[:user_id]=user.id
    #this one is for the base-64 encrypted token anyway so we don't need bcrypt.
    cookies.permanent[:remember_token]=user.remember_token
  end
#does the opposit of remember.. deletes the user's cookie from db and user.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  #returns true if user is logged in.
  def logged_in?
    !current_user.nil?
  end

  #Returns current user if logged in..
  def current_user
    #first check basically whether log_in function has happened...
    if (user_id= session[:user_id])
      # CURRENT USER = user.find_by Id or whatever it
      # was which is probably the one in the params. blue||green
      #maintain former state or change to this state called User.find_by...
      @current_user ||= User.find_by(id: user_id)
      #encrypted version of =signed...
    elsif (user_id= cookies.signed[:user_id])
      #Sets user to the same thing as above =or 
      user = User.find_by(id: user_id)
      #only allow the user to become that user if they're authenticated.
      if user && user.authenticated?(cookies[:remember_token])
        #if we pass all the authentication tests we log in user and set current user
        #to be that user.
        log_in user
        @current_user = user
      end
    end
  end
  #find current user...
  def current_user?(user)
    user == current_user
  end

  #Logging out involves destroying the session or refreshing it..
  def log_out
    #deletes from database, delete's client's cookies and delete's the session's
    #user_id
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  #returns true if the user is logged in, false otherwise...
end
