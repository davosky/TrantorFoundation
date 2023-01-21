class HolidaysController < ApplicationController
  before_action :set_holiday, only: %i[ show edit update destroy ]

  def index
    unless current_user.god == true || current_user.manager == true
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true)
    end
  end

  def show
    @holiday = Holiday.find(params[:id])
  end

  def new
    @holiday = Holiday.new
  end

  def edit
  end

  def create
    unless current_user.god == true || current_user.manager == true
      @holiday = current_user.holidays.build(holiday_params)
    else
      @holiday = Holiday.new(holiday_params)
    end

    if @holiday.save
      redirect_to holidays_path, notice: "holiday was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @holiday.updater = "#{current_user.last_name} #{current_user.first_name}"
    @holiday.update_date = Date.today

    if @holiday.update(holiday_params)
      redirect_to holidays_path, notice: "holiday was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @holiday.destroy
    redirect_to holidays_url, notice: "holiday was successfully destroyed."
  end

  private

  def set_holiday
    @holiday = Holiday.find(params[:id])
  end

  def holiday_params
    params.require(:holiday).permit(:user_id, :start_time, :end_time, :note, :updater, :update_date)
  end
end
