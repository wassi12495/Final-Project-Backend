class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  # TODO: I don't know if I will need this
  def show

  end

  def create
    @user = User.new(user_params)
    render json: @user
  end

  # TODO: User in updating user profile
  def update
  end

  # TODO: Later, allows users to remove all their personal data & account
  def destroy
  end

  private

  def user_params(params)
    params.require(user).permit(:username, :password_digest, :first_name, :last_name, :is_trainer)
  end
end
