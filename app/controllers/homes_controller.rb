class HomesController < ApplicationController
	def mypage
		@goals = Goal.where(user_id: current_user.id)
		@records = Record.where(user_id: current_user.id)
	end
end
