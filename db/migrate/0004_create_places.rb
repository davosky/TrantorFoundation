class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.integer :position
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
