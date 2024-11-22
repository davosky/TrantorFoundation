class PermitsController < ApplicationController
  load_and_authorize_resource

  before_action :set_permit, only: %i[ show edit update destroy ]

  def index
    if current_user.god == true
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true)
    elsif current_user.manager == true
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true).where(user_id: User.where(province: current_user.province, region: current_user.region))
    else
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true).where(user_id: current_user)
    end
  end

  def show
    @permit = Permit.find(params[:id])
  end

  def new
    @permit = Permit.new
  end

  def edit
  end

  def create
    unless current_user.god == true || current_user.manager == true
      @permit = current_user.permits.build(permit_params)
    else
      @permit = Permit.new(permit_params)
    end

    @permit.creator = "#{current_user.last_name} #{current_user.first_name}"

    if @permit.save
      PermitMailer.with(user: current_user, permit: @permit).permit_email.deliver_later
      redirect_to permits_path, notice: "permit was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @permit.updater = "#{current_user.last_name} #{current_user.first_name}"
    @permit.update_date = Date.today

    if @permit.update(permit_params)
      PermitMailer.with(user: current_user, permit: @permit).permit_email_update.deliver_later
      redirect_to permits_path, notice: "permit was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @permit.destroy
    PermitMailer.with(user: current_user).permit_email_destroy.deliver_later
    redirect_to permits_url, notice: "permit was successfully destroyed."
  end

  def search
    if current_user.god == true
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true).includes(:user).order("users.last_name ASC")
      @permits = @permits.order("start_time DESC")
    elsif current_user.manager == true
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true).where(user_id: User.where(province: current_user.province, region: current_user.region)).includes(:user).order("users.last_name ASC")
      @permits = @permits.order("start_time DESC")
    else
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true).where(user_id: current_user).order("start_time DESC")
    end
  end

  private

  def set_permit
    @permit = Permit.find(params[:id])
  end

  def permit_params
    params.require(:permit).permit(:user_id, :start_time, :end_time, :note, :updater, :update_date, :processed, :permit_type_id)
  end
end
