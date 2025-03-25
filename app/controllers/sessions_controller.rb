class SessionsController < ApplicationController
  def new
    # Prazna metoda za prikaz prijavne forme
  end

  def create
    # Poišči uporabnika glede na vpisani email
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # Če uporabnik obstaja in se geslo ujema, shranimo uporabnika v sejo
      session[:user_id] = user.id
      flash[:notice] = 'Uspešno prijavljen!'
      redirect_to root_path # Preusmeri na domačo stran
    else
      # Če je prijava neuspešna
      flash[:alert] = 'Neveljavna prijava'
      render :new # Ponovno naloži prijavno stran
    end
  end

  def destroy
    # Odstrani uporabnika iz seje, ko se odjavi
    session.delete(:user_id)
    flash[:notice] = 'Uspešno odjavljen!'
    redirect_to root_path # Preusmeri na domačo stran
  end
end
