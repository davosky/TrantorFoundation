module HourlyHolidaysHelper
  def hourly_holiday_full_user(hourly_holiday)
    "#{hourly_holiday.user.first_name} #{hourly_holiday.user.last_name}"
  end
end
