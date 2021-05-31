class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.integer :year
      t.integer :km
      t.string :picture
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
