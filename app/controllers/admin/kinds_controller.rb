class Admin::KindsController < Admin::BaseController
	before_action :set_kind, only: %i[show edit update destroy]

	def index
		@kinds = Kind.all
	end

	def new
		@kind = Kind.new
		binding.pry
	end

	def create
		@kind = Kind.new(kind_params)
		if @kind.save
			redirect_to admin_kinds_path
		else
			render :new
		end
	end

	def show; end

	def edit; end

	def update
		if @kind.update(kind_params)
			redirect_to admin_kind_path(@kind)
		else
			render :edit
		end
	end

	def destroy
		@kind.destroy!
		redirect_to admin_kinds_path
	end

	private

	def set_kind
		@kind = Kind.find(params[:id])
	end

	def kind_params
		params.require(:kind).permit(:name)
	end
end
