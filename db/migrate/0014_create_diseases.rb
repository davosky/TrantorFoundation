class CreateDiseases < ActiveRecord::Migration[7.0]
  def change
    create_table :diseases do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :certificate
      t.text :note
      t.boolean :processed
      t.string :updater
      t.string :creator
      t.date :update_date

      t.timestamps
    end
  end
end
