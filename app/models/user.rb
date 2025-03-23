class User < ApplicationRecord
    has_secure_password
  
    # Dodajemo lahko še nekaj validacij, če želiš
    validates :email, presence: true, uniqueness: true
  end
  