class Api::V1::ExercisesController < ApplicationController

  def index

    if current_user
      seed_exercises = (Exercise.where(user_id: nil))
      user_exercises = Exercise.where(user_id: current_user[:id])
      exercises = seed_exercises + user_exercises
      @exercises = exercises.map do |e|
        exercise_category = ExerciseCategory.find(e.exercise_category_id)
        {id: e.id, name: e.name, description: e.description, exercise_category: exercise_category, columns: e.columns}
      end
      render json: @exercises
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
        render json: {errors: @exercise.errors.full_messages}, status: 401
      end
    else
      render json: {error: "Failed to authenticate user."}, status: 404
    end

  end


  def destroy
  end



  private

  def exercise_params
    params.require(:exercise).permit(:id, :name, :description, :exercise_category_id, :columns)
  end

end
