class AddCostPerKmToVeichle < ActiveRecord::Migration[7.0]
  def change
    add_column :veichles, :cost_per_km, :decimal, precision: 8, scale: 2, default: 0.00
  end
end
