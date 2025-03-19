# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Znamke (Brands)
Brand.create(name: 'Audi')
Brand.create(name: 'BMW')
Brand.create(name: 'Mercedes-Benz')
Brand.create(name: 'Porsche')
Brand.create(name: 'Volkswagen')
Brand.create(name: 'Ferrari')
Brand.create(name: 'Lamborghini')
Brand.create(name: 'Tesla')
Brand.create(name: 'Ford')
Brand.create(name: 'Toyota')

# Modeli (Car Models)
CarModel.create(name: 'A4', brand_id: 1)
CarModel.create(name: '3 Series', brand_id: Brand.find_by(name: 'BMW').id)
CarModel.create(name: 'C-Class', brand_id: Brand.find_by(name: 'Mercedes-Benz').id)
CarModel.create(name: '911', brand_id: Brand.find_by(name: 'Porsche').id)
CarModel.create(name: 'Golf', brand_id: Brand.find_by(name: 'Volkswagen').id)
CarModel.create(name: '488 GTB', brand_id: Brand.find_by(name: 'Ferrari').id)
CarModel.create(name: 'Huracán', brand_id: Brand.find_by(name: 'Lamborghini').id)
CarModel.create(name: 'Model S', brand_id: Brand.find_by(name: 'Tesla').id)
CarModel.create(name: 'Mustang', brand_id: Brand.find_by(name: 'Ford').id)
CarModel.create(name: 'Corolla', brand_id: Brand.find_by(name: 'Toyota').id)

