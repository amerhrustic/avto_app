class Car < ApplicationRecord
  belongs_to :brand
  belongs_to :model  # Prej je bilo :car_model
  has_many_attached :images # Povezava s tabelo `images`
  validates :brand, :model, presence: true 
end
