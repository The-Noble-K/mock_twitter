class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log in user, redirect to user show page.
    else
      flash[:danger] = 'Invalid email and password combination'
      render 'new'
    end
  end

  def destroy
  end
end
