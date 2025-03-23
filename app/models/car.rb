class Car < ApplicationRecord
  belongs_to :brand
  belongs_to :model  # Prej je bilo :car_model
  has_one_attached :car_image
  has_many_attached :car_images
  validates :brand, :model, presence: true 
end
