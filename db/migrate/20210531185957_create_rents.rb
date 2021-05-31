class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.text :car_review
      t.text :user_review
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
