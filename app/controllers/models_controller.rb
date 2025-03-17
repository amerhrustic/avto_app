class ModelsController < ApplicationController
  def index
    models = Model.where(brand_id: params[:brand_id])
    render json: models
  end
end
