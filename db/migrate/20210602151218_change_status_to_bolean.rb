class ChangeStatusToBolean < ActiveRecord::Migration[6.0]
  def change
    change_column :rents, :status, :boolean, using: "status::boolean"
  end
end
