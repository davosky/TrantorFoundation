class CreatePermits < ActiveRecord::Migration[7.0]
  def change
    create_table :permits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :permit_type, null: false, foreign_key: true
      t.date :start_time
      t.date :end_time
      t.text :note
      t.boolean :processed
      t.string :updater
      t.string :creator
      t.date :update_date

      t.timestamps
    end
  end
end
