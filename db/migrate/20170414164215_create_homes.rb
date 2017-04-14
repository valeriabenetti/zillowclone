class CreateHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :homes do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :square_feet
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
