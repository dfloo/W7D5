class Api::UsersController < ApplicationController
  def create

    @user = User.new(user_params)
    if @user.save
      render :show
    else
      render json: @user.errors.full_messages, status: 422 #add status code
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
