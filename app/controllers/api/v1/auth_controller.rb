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
        is_trainer: @user.is_trainer,

        jwt: JWT.encode({user_id: @user.id}, ENV['secret_key'], 'HS256')
      }
    else
      render json: {error: ['Failed to login. Make sure you spelled your Username and Password correctly.']}, status: 404
    end
  end

  def show

    if current_user

      render json: {
        id: current_user.id,
        username: current_user.username,
        first_name: current_user.first_name,
        last_name: current_user.last_name,
        is_trainer: current_user.is_trainer,
        workouts: current_user.workouts,
        currentWorkout: current_user.current_workout,
        routines: current_user.routines.map do |routine|
          {id: routine.id, title:  routine.title, exercises: routine.routine_exercises, workouts: routine.workouts}
        end

      }
    else
      render json: {error: 'No id present on headers'}, status: 404
    end
  end

  def show_workouts

    if current_user
      workouts = current_user.workouts.map do |w|
        {id:w.id, title:w.title, time_of_workout: w.time_of_workout, exercises: w.exercises}
      end

      render json:{workouts: workouts }
    else
      render json: {error: 'Workouts: No id present on headers'}, status: 404
    end
  end

  def get_clients

    if current_user
      if current_user.is_trainer
        if !!current_user.clients
          @clients = current_user.clients.map do |client|
            {id: client.id, first_name: client.first_name, last_name:client.last_name, workouts: client.workouts}
          end
          render json: @clients
        else
          render json: {message: 'Trainer currently has no clients.'}
        end
      else
      render json: {message: 'User is not a trainer.'}
      end
    else
      render json: {error: "Must be logged in."}, status: 404
    end

  end


end
