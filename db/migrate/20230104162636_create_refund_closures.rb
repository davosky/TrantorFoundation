class CreateRefundClosures < ActiveRecord::Migration[7.0]
  def change
    create_table :refund_closures do |t|
      t.string :year_reference
      t.string :month_reference
      t.string :period_reference
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
