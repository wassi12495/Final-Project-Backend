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
      @workout = Workout.new(user_id: current_user["id"], routine_id: routine_id, time_of_workout:Time.now)
      if @workout.save
        exercises.each do |exercise|

          WorkoutExercise.create(workout:@workout, exercise_id: exercise["exercise_id"], name: exercise["name"], sets: exercise["sets"], reps: exercise["reps"], measure_input: exercise["measure_input"])

          CurrentWorkoutExercise.destroy(exercise["id"])
        end
        CurrentWorkout.destroy(current_workout_id)
        render json: @workout
      else

        render json: {error: "Failed to create workout."}, status: 401
      end
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
