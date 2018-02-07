class Api::V1::CurrentWorkoutsController < ApplicationController

  def show
  end

  def create
    if current_user

      if !!current_user.current_workout
        render json: {error: "This user already has an active workout."}, status: 409

      else
        @current_workout = CurrentWorkout.new(current_workout_params)
        @curren_workout.user = current_user
        byebug

        if @current_workout.save
          render json: {message: "Current Workout created"}, status: 200
        else
          render json: {error: "Failed to create current workout"}, status: 401
        end

      end

    else
      render json: {error: "Invalid Token: Must be logged in."}
    end
  end

  def update
  end

  def destroy
  end

  private
  def current_workout_params
    params.require(:current_workout).permit(:routine_id)

  end

end
