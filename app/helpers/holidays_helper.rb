module HolidaysHelper
  def holiday_full_user(holiday)
    "#{holiday.user.first_name} #{holiday.user.last_name}"
  end
end
