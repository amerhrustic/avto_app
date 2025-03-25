class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # shranimo ID uporabnika v sejo
      redirect_to root_path # preusmeri na domačo stran
    else
      render :new # če registracija ne uspe, ponudi obrazec ponovno
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
