class Api::V1::ExerciseCategoriesController < ApplicationController
  def index
    @ec = ExerciseCategory.all
    render json: @ec
  end
end
