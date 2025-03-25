class SessionsController < ApplicationController
  def new
    # NI POTREBNO: @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Prijava uspešna!"
    else
      flash.now[:alert] = "Nepravilen e-mail ali geslo"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Odjava uspešna!"
  end
end
