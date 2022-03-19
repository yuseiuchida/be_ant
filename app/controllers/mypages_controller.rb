class MypagesController < ApplicationController
	def show
		@user = User.find(params[:id])
		@goals = Goal.where(user_id: @user.id)
		@records = Record.where(user_id: @user.id)
	end
end
