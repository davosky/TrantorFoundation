class AddPrintRefundToRefundClosures < ActiveRecord::Migration[7.0]
  def change
    add_column :refund_closures, :print_refund, :string
  end
end
