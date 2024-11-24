class DashboardController < ApplicationController
  authorize_resource :class => false

  def this_week
    if current_user.god == true
      week_start = Date.today.beginning_of_week
      week_end = Date.today.end_of_week
      @holidays = Holiday.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @diseases = Disease.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @permits = Permit.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @hourly_holidays = HourlyHoliday.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @hourly_permits = HourlyPermit.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
    elsif current_user.manager == true
      week_start = Date.today.beginning_of_week
      week_end = Date.today.end_of_week
      @holidays = Holiday.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @holidays.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @diseases = Disease.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @diseases.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @permits = Permit.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @permits.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @hourly_holidays = HourlyHoliday.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @hourly_holidays.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @hourly_permits = HourlyPermit.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @hourly_permits.where(user_id: User.where(province: current_user.province, region: current_user.region))
    end
  end

  def previous_week
    if current_user.god == true
      week_start = Date.today.prev_week.beginning_of_week
      week_end = Date.today.prev_week.end_of_week
      @holidays = Holiday.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @diseases = Disease.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @permits = Permit.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @hourly_holidays = HourlyHoliday.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @hourly_permits = HourlyPermit.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
    elsif current_user.manager == true
      week_start = Date.today.prev_week.beginning_of_week
      week_end = Date.today.prev_week.end_of_week
      @holidays = Holiday.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @holidays.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @diseases = Disease.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @diseases.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @permits = Permit.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @permits.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @hourly_holidays = HourlyHoliday.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @hourly_holidays.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @hourly_permits = HourlyPermit.where(
        "(start_time BETWEEN :week_start AND :week_end) OR
       (end_time BETWEEN :week_start AND :week_end) OR
       (start_time < :week_start AND end_time > :week_end)",
        week_start: week_start,
        week_end: week_end,
      ).order(start_time: :ASC)
      @hourly_permits.where(user_id: User.where(province: current_user.province, region: current_user.region))
    end
  end

  def this_month
    if current_user.god == true
      month_start = Date.today.beginning_of_month
      month_end = Date.today.end_of_month
      @holidays = Holiday.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @diseases = Disease.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @permits = Permit.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @hourly_holidays = HourlyHoliday.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @hourly_permits = HourlyPermit.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
    elsif current_user.manager == true
      month_start = Date.today.beginning_of_month
      month_end = Date.today.end_of_month
      @holidays = Holiday.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @holidays.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @diseases = Disease.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @diseases.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @permits = Permit.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @permits.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @hourly_holidays = HourlyHoliday.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @hourly_holidays.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @hourly_permits = HourlyPermit.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @hourly_permits.where(user_id: User.where(province: current_user.province, region: current_user.region))
    end
  end

  def previous_month
    if current_user.god == true
      month_start = Date.today.prev_month.beginning_of_month
      month_end = Date.today.prev_month.end_of_month
      @holidays = Holiday.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @diseases = Disease.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @permits = Permit.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @hourly_holidays = HourlyHoliday.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @hourly_permits = HourlyPermit.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
    elsif current_user.manager == true
      month_start = Date.today.prev_month.beginning_of_month
      month_end = Date.today.prev_month.end_of_month
      @holidays = Holiday.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @holidays.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @diseases = Disease.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @diseases.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @permits = Permit.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @permits.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @hourly_holidays = HourlyHoliday.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @hourly_holidays.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @hourly_permits = HourlyPermit.where(
        "(start_time BETWEEN :month_start AND :month_end) OR
       (end_time BETWEEN :month_start AND :month_end) OR
       (start_time < :month_start AND end_time > :month_end)",
        month_start: month_start,
        month_end: month_end,
      ).order(start_time: :ASC)
      @hourly_permits.where(user_id: User.where(province: current_user.province, region: current_user.region))
    end
  end
end
