class Api::V1::WorkoutsController < ApplicationController


  def index
    @workouts = Workout.all
    render json: @workouts
  end
  def show

  end

  def create
    if current_user
      routine_id = params["routine_id"]
      current_workout_id = params["currentWorkout_id"]
      exercises = params["exercises"]
      byebug
      @workout = Workout.new(user_id: current_user["id"], routine_id: routine_id, time_of_workout:Time.now)
      render json: {message: "STILL IN TESTING"}
      # if @workout.save
      #
      #
      #
      # else
      #
      #   render json: {error: "Failed to create workout."}, status: 401
      # end
    else
      render json: {message: "Failed to authenticate user."}, status: 404
    end
  end


  def update

  end

  def destroy
  end

  private

  def workout_params
    params.require(:workout).permit(:user_id, :routine_id, :title, :time_of_workout)
  end

end
