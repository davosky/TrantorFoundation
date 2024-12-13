class AddReceiptFiveRefundToRefundClosures < ActiveRecord::Migration[7.0]
  def change
    add_column :refund_closures, :receipt_five_refund, :string
  end
end
