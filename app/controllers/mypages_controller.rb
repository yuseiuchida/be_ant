class MypagesController < ApplicationController
	def show
		@user = User.find(params[:id])
		@goals = Goal.where(user_id: @user.id)
		@records = Record.where(user_id: @user.id)
		@ant = @records.where(bug_status: 1)
		@grasshopper = @records.where(bug_status: 0)
	end
end
