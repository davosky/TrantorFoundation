class AddReceiptTwoRefundToRefundClosures < ActiveRecord::Migration[7.0]
  def change
    add_column :refund_closures, :receipt_two_refund, :string
  end
end
