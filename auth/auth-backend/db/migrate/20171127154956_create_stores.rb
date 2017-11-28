class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.references :company, foreign_key: true
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :rating
      t.string :types
      
      t.timestamps
    end
  end
end
