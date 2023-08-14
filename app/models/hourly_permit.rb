class HourlyPermit < ApplicationRecord
  belongs_to :user
  belongs_to :permit_type

  validates :user_id, :start_time, :end_time, :permit_type_id, presence: true

  validate :congruent_date_range

  def congruent_date_range
    if !end_time.blank? and end_time < start_time
      errors.add(:end_time, "Data Fine non puo essere minore di Data Inizio")
    end
    if !end_time.blank? and end_time.end_of_day != start_time.end_of_day
      errors.add(:end_time, "Le ore di ferie non possono eccedere oltre la giornata stessa")
    end
  end
end
