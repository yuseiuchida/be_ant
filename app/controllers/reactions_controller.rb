class ReactionsController < ApplicationController
	def create
		Reaction.create(user_id: current_user.id, record_id: params[:record_id])
		redirect_to records_path, notice: 'niceしました'
	end
	
	def destroy
		Reaction.find_by(user_id: current_user.id, record_id: params[:record_id]).destroy
		redirect_to records_path, notice: 'niceを取り消しました'
	end
end
