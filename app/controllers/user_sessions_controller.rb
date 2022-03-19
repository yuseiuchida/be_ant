class UserSessionsController < ApplicationController
	def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to mypage_path
    else
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
