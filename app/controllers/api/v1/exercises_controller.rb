class Api::V1::ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
    render json: @exercises
  end

  def create
  end


  def destroy
  end



  private

  def exercise_params(params)
    params.require(exercise).require(:id, :name, :description, :exercise_type, :weight, :sets, :reps, :distance, :duration, :measure )
  end

end
