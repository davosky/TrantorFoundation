class DashboardController < ApplicationController
  def index
  end

  def search
  end

  def whatsup
    if current_user.god == true
      # Holidays
      @holidays = Holiday.all
      # HourlyHoliday
      dstart = Date.today.to_date.beginning_of_day
      dend = Date.today.to_date.end_of_day
      @q = HourlyHoliday.ransack(params[:q])
      @hourly_holidays = @q.result(distinct: true)
        .where(start_time: dstart..dend)
    elsif current_user.manager == true
      # Holidays
      @holidays = Holiday.where(user_id: User.where(province: current_user.province, region: current_user.region))
      # HourlyHolidays
      dstart = Date.today.to_date.beginning_of_day
      dend = Date.today.to_date.end_of_day
      @q = HourlyHoliday.ransack(params[:q])
      @hourly_holidays = @q.result(distinct: true)
        .where(user_id: User.where(province: current_user.province, region: current_user.region))
        .where(start_time: dstart..dend)
    else
      # Holidays
      @holidays = Holiday.where(user_id: current_user)
      # HourlyHolidays
      dstart = Date.today.to_date.beginning_of_day
      dend = Date.today.to_date.end_of_day
      @q = HourlyHoliday.ransack(params[:q])
      @hourly_holidays = @q.result(distinct: true)
        .where(user_id: current_user)
        .where(start_time: dstart..dend)
    end
  end

  def peruser
  end
end
