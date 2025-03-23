class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :load_brands, only: %i[new edit create update]

  # Display all cars
  def index
    @cars = Car.all.includes(:brand, :model) # Avoid N+1 queries
  end

  # Show car details
  def show
  end

  # Show form to add a new car
  def new
    @car = Car.new
    @models = [] # Empty model selection until brand is selected
  end

  # Create a new car
  def create
    @car = Car.new(car_params)

    # Check if user entered a custom model name
    if params[:car][:model_name].present?
      model = Model.find_or_create_by(name: params[:car][:model_name], brand_id: params[:car][:brand_id])
      @car.model = model
    end

    if @car.save
      # ActiveStorage will handle image uploads
      redirect_to cars_path, notice: 'Car successfully added!'
    else
      @models = Model.where(brand_id: params[:car][:brand_id]) # Load models for selected brand
      render :new, status: :unprocessable_entity
    end
  end

  # Show form to edit a car
  def edit
    @models = Model.where(brand_id: @car.brand_id) # Load models for selected brand
  end

  # Update car details
  def update
    if @car.update(car_params)
      redirect_to cars_path, notice: 'Car successfully updated!'
    else
      @models = Model.where(brand_id: @car.brand_id) # Reload models for selected brand
      render :edit, status: :unprocessable_entity
    end
  end

  # Delete a car
  def destroy
    @car.destroy
    redirect_to cars_path, notice: 'Car successfully deleted!'
  end

  private

  # Permit safe parameters
  def car_params
    params.require(:car).permit(:brand_id, :model_id, :year, :price, :km, :fuel_type, :transmission, :description, :power, :color, images: [])
  end

  # Set @car based on ID
  def set_car
    @car = Car.find(params[:id])
  end

  # Load all brands for dropdown menu
  def load_brands
    @brands = Brand.all
  end
end
