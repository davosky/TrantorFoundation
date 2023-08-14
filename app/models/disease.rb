class Disease < ApplicationRecord
  belongs_to :user

  validates :user_id, :start_time, :end_time, presence: true

  validate :congruent_date_range

  def congruent_date_range
    if !end_time.blank? and end_time < start_time
      errors.add(:end_time, "Data Fine non puo essere minore di Data Inizio")
    end
  end
end
