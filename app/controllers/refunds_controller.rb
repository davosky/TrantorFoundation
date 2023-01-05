class RefundsController < ApplicationController
  load_and_authorize_resource

  before_action :set_refund, only: %i[ show edit update destroy ]

  before_action do
    ActiveStorage::Current.host = request.base_url
  end

  def index
    @refunds = Refund.where(user_id: current_user.id).order(created_at: "DESC")
  end

  def show
    @refund = Refund.find(params[:id])
  end

  def print
    @q = Refund.ransack(params[:q])
    @refunds = @q.result(distinct: true).order(refund_number: "DESC").where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: "refunds/print", pdf: "print" }
    end
  end

  def print_list
    @q = Refund.ransack(params[:q])
    @refunds = @q.result(distinct: true).order(refund_number: "DESC").where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: "refunds/print_list", pdf: "print_list" }
    end
  end

  def new
    @refund = Refund.new
  end

  def edit
  end

  def create
    @refund = current_user.refunds.build(refund_params)

    if @refund.save
      redirect_to refunds_path, notice: "refund was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @refund.update(refund_params)
      redirect_to refunds_path, notice: "refund was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @refund.destroy
    redirect_to refunds_url, notice: "refund was successfully destroyed."
  end

  private

  def set_refund
    @refund = Refund.find(params[:id])
  end

  def refund_params
    params.require(:refund).permit(:refund_number, :departure_date, :return_date, :request_date, :refund_date, :parking_cost, :food_cost, :room_cost, :ticket_cost, :generic_cost, :total_amount, :user_id, :place_id, :reason_id, :veichle_id, :road_id, :structure_id, :transport_id, :place_fr, :reason_fr, :road_fr, :structure_fr, :transport_fr, :veichle_fr, :road_lenght_fr, :highway_cost_fr)
  end
end
