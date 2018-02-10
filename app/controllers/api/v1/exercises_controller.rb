class Api::V1::ExercisesController < ApplicationController

  def index

    if current_user
      @exercises = (Exercise.where(user_id: nil))
      user_exercises = Exercise.where(user_id: current_user[:id])
      render json: {user_exercises: user_exercises, seed_exercises: @exercises}
    else
      render json: {message: "Must be logged in."}
    end
  end

  def create
    if current_user

      @exercise = Exercise.new(exercise_params)
      @exercise["user_id"] = current_user["id"]
      if @exercise.save
        render json: @exercise
      else
        render json: {error: "Failed to create new exercise."}, status: 401
      end
    else
      render json: {error: "Failed to authenticate user."}, status: 404
    end

  end


  def destroy
  end



  private

  def exercise_params
    params.require(:exercise).permit(:id, :name, :description, :exercise_category_id)
  end

end
