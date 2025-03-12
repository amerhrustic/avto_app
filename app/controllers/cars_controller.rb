class CarsController < ApplicationController
  # List all cars
  def index
    @cars = Car.all
  end

  # Show a specific car's details
  def show
    @car = Car.find(params[:id])
  end

  # Show the form to create a new car
  def new
    @car = Car.new
    @brands = Brand.all  # Load all brands for the dropdown
    @models = Model.all  # Load all models for the dropdown
  end

  # Create a new car in the database
  def create
    # First, find or create the brand based on the name
    @brand = Brand.find_or_create_by(name: params[:car][:brand_name])

    # Then, find or create the model based on the name and brand_id
    @model = Model.find_or_create_by(name: params[:car][:model_name], brand_id: @brand.id)

    # Now create the car with the correct brand_id and model_id
    @car = Car.new(car_params.merge(brand_id: @brand.id, model_id: @model.id))

    if @car.save
      redirect_to cars_path, notice: 'Car successfully added!'
    else
      @brands = Brand.all  # Re-load brands in case of error
      @models = Model.all  # Re-load models in case of error
      render :new
    end
  end

  # Show the form to edit an existing car
  def edit
    @car = Car.find(params[:id])
    @brands = Brand.all  # Load all brands for the dropdown
    @models = Model.all  # Load all models for the dropdown
  end

  # Update an existing car's details
  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to cars_path, notice: 'Car successfully updated!'
    else
      @brands = Brand.all  # Re-load brands in case of error
      @models = Model.all  # Re-load models in case of error
      render :edit
    end
  end

  # Delete a car
  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, notice: 'Car successfully deleted!'
  end

  private

  # Only allow trusted parameters
  def car_params
    params.require(:car).permit(:year, :price, :km, :fuel_type, :car_image)
  end
end
