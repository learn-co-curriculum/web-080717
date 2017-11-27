class Api::V1::WaitTimesController < ApplicationController
  before_action :set_wait_time, only: [:show, :update, :destroy]

  # GET /wait_times
  def index
    @wait_times = WaitTime.all

    render json: @wait_times
  end

  # GET /wait_times/1
  def show
    render json: @wait_time
  end

  # POST /wait_times
  def create
    @wait_time = WaitTime.new(wait_time_params)

    if @wait_time.save
      render json: @wait_time, status: :created, location: @wait_time
    else
      render json: @wait_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wait_times/1
  def update
    if @wait_time.update(wait_time_params)
      render json: @wait_time
    else
      render json: @wait_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wait_times/1
  def destroy
    @wait_time.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wait_time
      @wait_time = WaitTime.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wait_time_params
      params.require(:wait_time).permit(:store_id, :user_id)
    end
end
