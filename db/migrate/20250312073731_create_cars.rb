class CreateCars < ActiveRecord::Migration[8.0]
  def change
    create_table :cars do |t|
      t.references :brand, null: false, foreign_key: true
      t.references :model, null: false, foreign_key: true
      t.integer :year
      t.decimal :price
      t.integer :km
      t.string :fuel_type
      t.string :transmission
      t.text :description
      t.integer :power
      t.string :color

      t.timestamps
    end
  end
end
