class DashboardController < ApplicationController
  authorize_resource :class => false

  def index
  end

  def search
  end

  def whatsup
    if current_user.god == true
      @holidays = Holiday.all
      @diseases = Disease.all
      dstart = Date.today.to_date.beginning_of_day
      dend = Date.today.to_date.end_of_day
      @hourly_holidays = HourlyHoliday.where(start_time: dstart..dend)
    elsif current_user.manager == true
      @holidays = Holiday.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @diseases = Disease.where(user_id: User.where(province: current_user.province, region: current_user.region))
      dstart = Date.today.to_date.beginning_of_day
      dend = Date.today.to_date.end_of_day
      @hourly_holidays = HourlyHoliday.where(user_id: User.where(province: current_user.province, region: current_user.region))
      @hourly_holidays = @hourly_holidays.where(start_time: dstart..dend)
    end
  end

  def peruser
  end
end
