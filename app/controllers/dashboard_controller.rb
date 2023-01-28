class DashboardController < ApplicationController
  def index
  end

  def search
  end

  def whatsup
    @holidays = Holiday.all
  end

  def peruser
  end
end
