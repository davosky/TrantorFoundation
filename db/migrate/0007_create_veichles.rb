class CreateVeichles < ActiveRecord::Migration[7.0]
  def change
    create_table :veichles do |t|
      t.string :name
      t.string :producer
      t.string :license_plate
      t.integer :position
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
