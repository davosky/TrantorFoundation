class RefundClosuresController < ApplicationController
  load_and_authorize_resource

  before_action :set_refund_closure, only: %i[ show edit update destroy ]

  before_action do
    ActiveStorage::Current.host = request.base_url
  end

  def index
    @q = RefundClosure.ransack(params[:q])
    @refund_closures = @q.result(distinct: true).order(created_at: "DESC").where(user_id: current_user.id)
  end

  def search
    if current_user.god == true
      @q = RefundClosure.ransack(params[:q])
      @refund_closures = @q.result(distinct: true).order(created_at: "DESC")
    else
      @q = RefundClosure.ransack(params[:q])
      @refund_closures = @q.result(distinct: true).order(created_at: "DESC").where(user_id: User.where(province: current_user.province, region: current_user.region))
    end
  end

  def show
    @refund_closure = RefundClosure.find(params[:id])
  end

  def new
    @refund_closure = RefundClosure.new
  end

  def edit
  end

  def create
    @refund_closure = current_user.refund_closures.build(refund_closure_params)

    if @refund_closure.save
      redirect_to refund_closures_path, notice: "refund_closure was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @refund_closure.update(refund_closure_params)
      redirect_to search_refund_closures_path, notice: "refund_closure was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @refund_closure.destroy
    redirect_to refund_closures_url, notice: "refund_closure was successfully destroyed."
  end

  private

  def set_refund_closure
    @refund_closure = RefundClosure.find(params[:id])
  end

  def refund_closure_params
    if current_user.god == true || current_user.admin == true || current_user.manager == true
      params.require(:refund_closure).permit(:year_reference, :month_reference, :period_reference, :user_id, :refund_print, :refund_summary, :highway_movements, :refund_receipt_1, :refund_receipt_2, :refund_receipt_3, :refund_receipt_4, :refund_receipt_5, :refund_receipt_6, :payed)
    else
      params.require(:refund_closure).permit(:year_reference, :month_reference, :period_reference, :user_id, :refund_print, :refund_summary, :highway_movements, :refund_receipt_1, :refund_receipt_2, :refund_receipt_3, :refund_receipt_4, :refund_receipt_5, :refund_receipt_6)
    end
  end
end
