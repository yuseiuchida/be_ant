class HomesController < ApplicationController
	def mypage
		@goals = Goal.all
	end
end
