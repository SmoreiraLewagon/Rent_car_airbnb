class AddNameDateTimeToRents < ActiveRecord::Migration[6.0]
  def change
    add_column :rents, :name, :string
    add_column :rents, :date, :string
    add_column :rents, :time, :string
  end
end
