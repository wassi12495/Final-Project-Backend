class Api::V1::AuthController < ApplicationController



  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render json: {
        id: @user.id,
        username: @user.username,
        jwt: JWT.encode({user_id: @user.id}, ENV['secret_key'], 'HS256')
      }
    else
      render json: {error: 'User not found'}, status: 404
    end
  end




  def index
  end





end
