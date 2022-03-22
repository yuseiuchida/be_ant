class Admin::GoalsController < Admin::BaseController
	before_action :set_goal, only: %i[show edit update destroy]

	def index
		@goals = Goal.all
	end

	def show; end

	def edit
		@kinds = Kind.all
	end

	def update
		if @goal.update(goal_params)
			redirect_to admin_goal_path(@goal)
		else
			render :edit
		end
	end

	def destroy
		@goal.destroy!
		redirect_to admin_goals_path
	end

	private

	def set_goal
		@goal = Goal.find(params[:id])
	end

	def goal_params
		params.require(:goal).permit(:title, :due_day, :status, :kind_id)
	end
end
