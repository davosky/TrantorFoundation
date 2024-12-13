class AddReceiptOneRefundToRefundClosures < ActiveRecord::Migration[7.0]
  def change
    add_column :refund_closures, :receipt_one_refund, :string
  end
end
