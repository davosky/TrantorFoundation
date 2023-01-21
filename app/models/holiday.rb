class Holiday < ApplicationRecord
  belongs_to :user

  validates :user_id, :start_time, :end_time, presence: true
end
