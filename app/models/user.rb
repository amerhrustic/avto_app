class User < ApplicationRecord
  has_secure_password  # To omogoči geslo, shranjeno v password_digest

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
