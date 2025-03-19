class AddBrandIdToCarModels < ActiveRecord::Migration[8.0]
  def change
    add_column :car_models, :brand_id, :integer
  end
end
