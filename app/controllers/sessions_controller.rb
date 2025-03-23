class SessionsController < ApplicationController
  def new
    # render login form
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id  # Store user id in the session
      redirect_to cars_path, notice: "Welcome back, #{@user.email}!"
    else
      flash.now[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil  # Logout the user
    redirect_to root_path, notice: "Logged out successfully."
  end
end
