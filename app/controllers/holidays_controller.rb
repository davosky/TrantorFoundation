class HolidaysController < ApplicationController
  load_and_authorize_resource

  before_action :set_holiday, only: %i[ show edit update destroy ]

  def index
    if current_user.god == true
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true)
    elsif current_user.manager == true
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true).where(user_id: User.where(province: current_user.province, region: current_user.region))
    else
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true).where(user_id: current_user)
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

    @holiday.creator = "#{current_user.last_name} #{current_user.first_name}"

    if @holiday.save
      HolidayMailer.with(user: current_user, holiday: @holiday).holiday_email.deliver_later
      redirect_to holidays_path, notice: "holiday was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @holiday.updater = "#{current_user.last_name} #{current_user.first_name}"
    @holiday.update_date = Date.today

    if @holiday.update(holiday_params)
      HolidayMailer.with(user: current_user, holiday: @holiday).holiday_email_update.deliver_later
      redirect_to holidays_path, notice: "holiday was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @holiday.destroy
    HolidayMailer.with(user: current_user).holiday_email_destroy.deliver_later
    redirect_to holidays_url, notice: "holiday was successfully destroyed."
  end

  def search
    if current_user.god == true
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true).includes(:user).order("users.last_name ASC")
      @holidays = @holidays.order("start_time DESC").page(params[:page])
    elsif current_user.manager == true
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true).where(user_id: User.where(province: current_user.province, region: current_user.region)).includes(:user).order("users.last_name ASC")
      @holidays = @holidays.order("start_time DESC").page(params[:page])
    else
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true).where(user_id: current_user).order("start_time DESC").page(params[:page])
    end
  end

  private

  def set_holiday
    @holiday = Holiday.find(params[:id])
  end

  def holiday_params
    params.require(:holiday).permit(:user_id, :start_time, :end_time, :note, :updater, :update_date, :processed)
  end
end
