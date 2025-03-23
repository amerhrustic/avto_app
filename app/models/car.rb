class Car < ApplicationRecord
  belongs_to :brand
  belongs_to :model  # Prej je bilo :car_model
  has_one_attached :car_image
  validates :brand, :model, presence: true 
end
