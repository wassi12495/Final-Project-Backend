class Api::V1::ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
    render json: @exercises
  end

  def create
    byebug
    @exercise = Exercise.new(exercise_params)

  end


  def destroy
  end



  private

  def exercise_params
    params.require(:exercise).permit(:id, :name, :description, :exercise_category)
  end

end
