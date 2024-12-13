class AddReceiptFourRefundToRefundClosures < ActiveRecord::Migration[7.0]
  def change
    add_column :refund_closures, :receipt_four_refund, :string
  end
end
