class UsersController < ApplicationController
  def index
    if current_user.god == true
      @users = User.all.order(last_name: "ASC").page(params[:page])
    else current_user.manager == true
      @users = User.where(province: current_user.province, region: current_user.region).order("users.last_name ASC")
      @users = @users.page(params[:page])     end
  end

  def show
    @user = User.find_by_id(params[:id])

    @holidays = Holiday.where(user_id: @user.id).order(start_time: "DESC")
    @hourly_holidays = HourlyHoliday.where(user_id: @user.id).order(start_time: "DESC")
    @permits = Permit.where(user_id: @user.id).order(start_time: "DESC")
    @hourly_permits = HourlyPermit.where(user_id: @user.id).order(start_time: "DESC")
    @diseases = Disease.where(user_id: @user.id).order(start_time: "DESC")
    @refund_closures = RefundClosure.where(user_id: @user.id).order(created_at: "DESC")
  end
end
