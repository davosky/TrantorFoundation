class AddSummaryRefundToRefundClosures < ActiveRecord::Migration[7.0]
  def change
    add_column :refund_closures, :summary_refund, :string
  end
end
