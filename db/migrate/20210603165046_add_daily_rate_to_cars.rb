class AddDailyRateToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :daily_rate, :float
  end
end
