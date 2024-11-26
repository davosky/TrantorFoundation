class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    results = @q.result.includes(:holidays, :hourly_holidays, :permits, :hourly_permits, :diseases)
    @user = results.first
    @multiple_matches = results.count > 1
  end
end
