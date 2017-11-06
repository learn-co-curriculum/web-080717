class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      token = encode_token({ user_id: @user.id })
      render json: { username: @user.username, jwt: token }, status: 202
    else
      render json: { message: "#{@user.errors.messages.keys[0]} #{@user.errors[@user.errors.messages.keys[0]][0]}" }, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
