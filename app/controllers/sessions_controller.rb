class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])  # Prilagojeno, ker obrazec uporablja model User
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      render "users/new"  # Ker se obrazec nahaja v users#new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
