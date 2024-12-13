class RefundClosure < ApplicationRecord
  belongs_to :user, optional: true

  mount_uploader :print_refund, PrintRefundUploader
  mount_uploader :summary_refund, SummaryRefundUploader
  mount_uploader :highway_movement_refund, HighwayMovementRefundUploader
  mount_uploader :receipt_one_refund, ReceiptOneRefundUploader
  mount_uploader :receipt_two_refund, ReceiptTwoRefundUploader
  mount_uploader :receipt_three_refund, ReceiptThreeRefundUploader
  mount_uploader :receipt_four_refund, ReceiptFourRefundUploader
  mount_uploader :receipt_five_refund, ReceiptFiveRefundUploader
  mount_uploader :receipt_six_refund, ReceiptSixRefundUploader

  has_one_attached :refund_print
  has_one_attached :refund_summary
  has_one_attached :highway_movements
  has_one_attached :refund_receipt_1
  has_one_attached :refund_receipt_2
  has_one_attached :refund_receipt_3
  has_one_attached :refund_receipt_4
  has_one_attached :refund_receipt_5
  has_one_attached :refund_receipt_6

  validates :year_reference, presence: true
  validates_presence_of :month_reference, :unless => :period_reference?
  validates_presence_of :period_reference, :unless => :month_reference?
end
