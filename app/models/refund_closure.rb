class RefundClosure < ApplicationRecord
  belongs_to :user, optional: true

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
