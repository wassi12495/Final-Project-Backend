class Api::V1::WorkoutsController < ApplicationController


  def index
    @workouts = Workout.all
    render json: @workouts
  end
  def show

  end

  def create
    render json: {message: "You are still in testing mode!"}
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
