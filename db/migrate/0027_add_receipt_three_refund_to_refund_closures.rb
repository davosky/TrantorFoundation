class AddReceiptThreeRefundToRefundClosures < ActiveRecord::Migration[7.0]
  def change
    add_column :refund_closures, :receipt_three_refund, :string
  end
end
