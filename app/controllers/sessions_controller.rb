class SessionsController < ApplicationController
  #Render the LOG IN PAGE...! Where the user can log in to this session...
  def new
  end
  #Actually create the session based on the params if authenticated!
  def create
    user= User.find_by(email: params[:session][:email])
    #Did the authenticate function return AND the user is not nil...
    if !!(user&&user.authenticate(params[:session][:password]))
      #Log in user and redirect to show.
      log_in(user)
      #is the checkbox checked for remember me?
      params[:session][:remember_me]== "1" ?
        remember(user) : forget(user)
        #If so then we will persist their session id to DB and then...
        redirect_to user
    else
      #flash an error messages...Flashes for a short time using flash now.
      #only needed for render after the flash rather than redirect...
      #auto clear flash on the redirect but not render
      flash.now[:danger]= "Invalid email/password combo"
      render "new"
    end
  end

  def destroy
    binding.pry
    #applies log out function to user if they were logged in when it was pressed
    log_out if logged_in?
    #go back home.
    redirect_to root_url
  end

end
