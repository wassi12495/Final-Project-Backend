class Api::V1::WorkoutsController < ApplicationController


  def index
    @workouts = Workout.all
    render json: @workouts
  end
  def show

  end

  def create
  end


  def update

  end

  def destroy
  end

  private

  def workout_params(params)
    params.require(workout).permit(:user_id,)
  end

end
