class SessionsController < ApplicationController
  # logging in (show the login form)
  def new
  end

  # handle the post from the login form/page
  def create
    email = params[:email]
    password = params[:password]

    # Find the user by their email
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      # Save the user_id in the session cookie
      session[:user_id] = user.id
      redirect_to homes_path
    else
      redirect_to login_path
    end

    def destory
      # Remove the user_id from the session
      session[:user_id] = nil

      # Send the user to the landing page
      redirect_to root_path
    end
  end
end
