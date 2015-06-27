# CustomMaterialize
Materialize Parallax Template in Ruby on Rails (includes Users/Logins/Authentication and of course the Materialize CSS).

## Want to use Materialize CSS with Ruby on Rails?

You can try the gem, you can try downloading the gem and tinkering with app assets, or you can just use this starter kit for MaterializeCSS. Hit the ground running with your next Ruby on Rails MaterializeCSS project More info @ [MaterializeCSS](http://materializecss.com).

## It provides:

* `.flexxed-wrapper` class to make the exterior a flexbox.
* `.flexxed` class making the items a flexbox currently set to 1 box per row at small screen size ->2 per row ->3 per row.
* `.#{$color}-border` { which lets you set a 1px border in your materialize CSS color...} --currently displayed with an `<hr>`
* Reconstruction of some javascript methods to allow for form validation and handling of forms active as intended.
* Premade forms for new user sign ups, logins, and error handling partials.
* Navbar with links to user sign ins/profile info depending on if logged in and that kind of stuff.
* BCrypt password storage, custom page titles, gravatar images.
* And more to come in the future including on test suite for authentication (it's mostly ready).

## Check out the sample site:
[Custom Materialize Sample](http://razgoldin.com:4444)

## Known Issues I haven't gotten the chance to fix yet:
* Mobile Responsive NavBar
* Safari support for some of the flexwrapping.
* Button Vertical alignment seems off.
* Bottom of Users View Card advising users to sign up has strange responsive activity.
* Better integration with Rails syntax of forms with labels I used some hacking to put labels/inputs in the right position especially after they get wrapped in a class "form-with-errors" on error submission.
