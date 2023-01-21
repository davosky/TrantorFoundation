class CreateHolidays < ActiveRecord::Migration[7.0]
  def change
    create_table :holidays do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.text :note
      t.boolean :processed
      t.string :updater
      t.date :update_date

      t.timestamps
    end
  end
end
