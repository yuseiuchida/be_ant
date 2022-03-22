class Admin::RecordsController < Admin::BaseController
	before_action :set_record, only: %i[show edit update destroy]

	def index
		@records = Record.all
	end

	def show; end

	def edit; end

	def update
		if @record.update(record_params)
			redirect_to admin_record_path(@record)
		else
			render :edit
		end
	end

	def destroy
		@record.destroy!
		redirect_to admin_records_path
	end

	private

	def set_record
		@record = Record.find(params[:id])
	end

	def record_params
		require(:record).permit(:content, :bug_status)
	end
end
