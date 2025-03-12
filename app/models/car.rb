class Car < ApplicationRecord
  belongs_to :brand
  belongs_to :car_model  # Ensure this matches the name of the CarModel model
  has_one_attached :car_image
  validates :brand, :car_model, presence: true 
end
