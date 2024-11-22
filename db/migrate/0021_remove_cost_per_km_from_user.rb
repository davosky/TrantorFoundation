class RemoveCostPerKmFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :cost_per_km
  end
end
