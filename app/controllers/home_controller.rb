class HomeController < ApplicationController
  before_action :get_users, only: [:show]

  def index
  end

  def credits
  end
end
