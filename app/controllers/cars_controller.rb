class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :load_brands, only: %i[new edit create update]

  # Prikaz vseh avtomobilov
  def index
    @cars = Car.all.includes(:brand, :model) # Prepreči N+1 queries
  end

  # Prikaz podrobnosti o avtu
  def show
  end

  # Prikaži obrazec za dodajanje novega avtomobila
  def new
    @car = Car.new
    @models = [] # Prazna izbira modelov, dokler uporabnik ne izbere znamke
  end

  # Ustvari nov avto v bazi
  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to cars_path, notice: 'Car successfully added!'
    else
      @models = Model.where(brand_id: params[:car][:brand_id]) # Naloži modele izbrane znamke
      render :new, status: :unprocessable_entity
    end
  end

  # Prikaži obrazec za urejanje avtomobila
  def edit
    @models = Model.where(brand_id: @car.brand_id) # Pravilni modeli za izbrano znamko
  end

  # Posodobi podatke o avtu
  def update
    if @car.update(car_params)
      redirect_to cars_path, notice: 'Car successfully updated!'
    else
      @models = Model.where(brand_id: @car.brand_id)
      render :edit, status: :unprocessable_entity
    end
  end

  # Izbriši avto
  def destroy
    @car.destroy
    redirect_to cars_path, notice: 'Car successfully deleted!'
  end

  private

  # Dovoli le varne parametre
  def car_params
    params.require(:car).permit(:brand_id, :model_id, :year, :price, :km, :fuel_type, :car_image)
  end

  # Nastavi @car glede na ID
  def set_car
    @car = Car.find(params[:id])
  end

  # Naloži vse znamke za dropdown meni
  def load_brands
    @brands = Brand.all
  end
end
