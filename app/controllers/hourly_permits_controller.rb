class HourlyPermitsController < ApplicationController
  load_and_authorize_resource

  before_action :set_hourly_permit, only: %i[ show edit update destroy ]

  def index
    if current_user.god == true
      @q = HourlyPermit.ransack(params[:q])
      @hourly_permits = @q.result(distinct: true)
    elsif current_user.manager == true
      @q = HourlyPermit.ransack(params[:q])
      @hourly_permits = @q.result(distinct: true).where(user_id: User.where(province: current_user.province, region: current_user.region))
    else
      @q = HourlyPermit.ransack(params[:q])
      @hourly_permits = @q.result(distinct: true).where(user_id: current_user)
    end
  end

  def show
    @hourly_permit = HourlyPermit.find(params[:id])
  end

  def new
    @hourly_permit = HourlyPermit.new
  end

  def edit
  end

  def create
    unless current_user.god == true || current_user.manager == true
      @hourly_permit = current_user.hourly_permits.build(hourly_permit_params)
    else
      @hourly_permit = HourlyPermit.new(hourly_permit_params)
    end

    @hourly_permit.creator = "#{current_user.last_name} #{current_user.first_name}"

    if @hourly_permit.save
      HourlyPermitMailer.with(user: current_user, hourly_permit: @hourly_permit).hourly_permit_email.deliver_later
      redirect_to hourly_permits_path, notice: "hourly_permit was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @hourly_permit.updater = "#{current_user.last_name} #{current_user.first_name}"
    @hourly_permit.update_date = Date.today

    if @hourly_permit.update(hourly_permit_params)
      HourlyPermitMailer.with(user: current_user, hourly_permit: @hourly_permit).hourly_permit_email_update.deliver_later
      redirect_to hourly_permits_path, notice: "hourly_permit was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hourly_permit.destroy
    HourlyPermitMailer.with(user: current_user).hourly_permit_email_destroy.deliver_later
    redirect_to hourly_permits_url, notice: "hourly_permit was successfully destroyed."
  end

  def search
    if current_user.god == true
      @q = HourlyPermit.ransack(params[:q])
      @hourly_permits = @q.result(distinct: true).includes(:user).order("users.last_name ASC")
      @hourly_permits = @hourly_permits.order("start_time DESC").page(params[:page])
    elsif current_user.manager == true
      @q = HourlyPermit.ransack(params[:q])
      @hourly_permits = @q.result(distinct: true).where(user_id: User.where(province: current_user.province, region: current_user.region)).includes(:user).order("users.last_name ASC")
      @hourly_permits = @hourly_permits.order("start_time DESC").page(params[:page])
    else
      @q = HourlyPermit.ransack(params[:q])
      @hourly_permits = @q.result(distinct: true).where(user_id: current_user).order("start_time DESC").page(params[:page])
    end
  end

  private

  def set_hourly_permit
    @hourly_permit = HourlyPermit.find(params[:id])
  end

  def hourly_permit_params
    params.require(:hourly_permit).permit(:user_id, :start_time, :end_time, :note, :updater, :update_date, :processed, :permit_type_id)
  end
end
