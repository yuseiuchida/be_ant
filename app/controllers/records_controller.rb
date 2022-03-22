class RecordsController < ApplicationController
  before_action :set_record, only: %i[ show edit update destroy ]
  before_action :set_goals, only: %i[new]
  # GET /records or /records.json
  def index
    @records = Record.all
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # POST /records or /records.json
  def create
    @record = current_user.records.build(record_params)
    if @record.save
      redirect_to mypage_path(current_user)
    else
      render :new
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

    def set_goals
      @goals = current_user.goals.where.not(status: "達成")
    end
end
