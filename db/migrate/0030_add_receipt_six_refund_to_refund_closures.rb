class AddReceiptSixRefundToRefundClosures < ActiveRecord::Migration[7.0]
  def change
    add_column :refund_closures, :receipt_six_refund, :string
  end
end
