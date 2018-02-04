class Api::V1::AuthController < ApplicationController



  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])

      render json: {
        id: @user.id,
        username: @user.username,
        first_name: @user.first_name,
        last_name: @user.last_name,
        workouts: @user.workouts,
        routines: @user.routines,
        jwt: JWT.encode({user_id: @user.id}, ENV['secret_key'], 'HS256')
      }
    else

      render json: {error: 'User not found'}, status: 404
    end
  end

  def show

    if current_user
      render json: {
        id: current_user.id,
        username: current_user.username,
        first_name: current_user.first_name,
        last_name: current_user.last_name,
        workouts: current_user.workouts,
        routines: current_user.routines,
      }
    else
      render json: {error: 'No id present on headers'}, status: 404
    end
  end





end
