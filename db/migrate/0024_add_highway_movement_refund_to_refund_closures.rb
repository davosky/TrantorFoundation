class AddHighwayMovementRefundToRefundClosures < ActiveRecord::Migration[7.0]
  def change
    add_column :refund_closures, :highway_movement_refund, :string
  end
end
