class HourlyHolidaysController < ApplicationController
  load_and_authorize_resource

  before_action :set_hourly_holiday, only: %i[ show edit update destroy ]

  def index
    if current_user.god == true
      @q = HourlyHoliday.ransack(params[:q])
      @hourly_holidays = @q.result(distinct: true)
    elsif current_user.manager == true
      @q = HourlyHoliday.ransack(params[:q])
      @hourly_holidays = @q.result(distinct: true).where(user_id: User.where(province: current_user.province, region: current_user.region))
    else
      @q = HourlyHoliday.ransack(params[:q])
      @hourly_holidays = @q.result(distinct: true).where(user_id: current_user)
    end
  end

  def show
    @hourly_holiday = HourlyHoliday.find(params[:id])
  end

  def new
    @hourly_holiday = HourlyHoliday.new
  end

  def edit
  end

  def create
    unless current_user.god == true || current_user.manager == true
      @hourly_holiday = current_user.hourly_holidays.build(hourly_holiday_params)
    else
      @hourly_holiday = HourlyHoliday.new(hourly_holiday_params)
    end

    @hourly_holiday.creator = "#{current_user.last_name} #{current_user.first_name}"

    if @hourly_holiday.save
      redirect_to hourly_holidays_path, notice: "hourly_holiday was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @hourly_holiday.updater = "#{current_user.last_name} #{current_user.first_name}"
    @hourly_holiday.update_date = Date.today

    if @hourly_holiday.update(hourly_holiday_params)
      redirect_to hourly_holidays_path, notice: "hourly_holiday was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hourly_holiday.destroy
    redirect_to hourly_holidays_url, notice: "hourly_holiday was successfully destroyed."
  end

  private

  def set_hourly_holiday
    @hourly_holiday = HourlyHoliday.find(params[:id])
  end

  def hourly_holiday_params
    params.require(:hourly_holiday).permit(:user_id, :start_time, :end_time, :note, :updater, :update_date, :processed)
  end
end
