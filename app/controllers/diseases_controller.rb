class DiseasesController < ApplicationController
  load_and_authorize_resource

  before_action :set_disease, only: %i[ show edit update destroy ]

  def index
    if current_user.god == true
      @q = Disease.ransack(params[:q])
      @diseases = @q.result(distinct: true)
    elsif current_user.manager == true
      @q = Disease.ransack(params[:q])
      @diseases = @q.result(distinct: true).where(user_id: User.where(province: current_user.province, region: current_user.region))
    else
      @q = Disease.ransack(params[:q])
      @diseases = @q.result(distinct: true).where(user_id: current_user)
    end
  end

  def show
    @disease = Disease.find(params[:id])
  end

  def new
    @disease = Disease.new
  end

  def edit
  end

  def create
    unless current_user.god == true || current_user.manager == true
      @disease = current_user.diseases.build(disease_params)
    else
      @disease = Disease.new(disease_params)
    end

    @disease.creator = "#{current_user.last_name} #{current_user.first_name}"

    if @disease.save
      redirect_to diseases_path, notice: "disease was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @disease.updater = "#{current_user.last_name} #{current_user.first_name}"
    @disease.update_date = Date.today

    if @disease.update(disease_params)
      redirect_to diseases_path, notice: "disease was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @disease.destroy
    redirect_to diseases_url, notice: "disease was successfully destroyed."
  end

  private

  def set_disease
    @disease = Disease.find(params[:id])
  end

  def disease_params
    params.require(:disease).permit(:user_id, :start_time, :end_time, :certificate, :note, :updater, :update_date, :processed)
  end
end
