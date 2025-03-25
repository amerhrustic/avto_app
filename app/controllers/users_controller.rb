class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # Privzeta vloga, če ni izbrana
    @user.role ||= 'user' # Privzeta vloga za uporabnika

    if @user.save
      flash[:notice] = "Registracija uspešna"
      redirect_to login_path
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
