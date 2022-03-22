class RecordsController < ApplicationController
  before_action :set_record, only: %i[ show edit update destroy ]

  # GET /records or /records.json
  def index
    @records = Record.all
  end

  # GET /records/new
  def new
    @record = Record.new
    @goals = Goal.where(user_id: current_user.id)
  end

  # POST /records or /records.json
  def create
    @record = current_user.records.build(record_params)
    if @record.save
      redirect_to mypage_path(current_user)
    else
      redirect_to root_path
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @record.destroy!
    redirect_to goal_path(id: @record.goal.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def record_params
      params.require(:record).permit(:goal_id, :content, :bug_status)
    end
end
