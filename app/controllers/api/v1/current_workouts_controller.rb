class Api::V1::CurrentWorkoutsController < ApplicationController

  def index
    if current_user
      if current_user.current_workout
        @curr_workout = CurrentWorkout.find(current_user.current_workout[:id])
        render json: @curr_workout
      else
        render json: {error: "This user has no current workout."}
      end

    end
  end

  def create
    if current_user

      if current_user.current_workout.nil?()
        @current_workout = CurrentWorkout.new(current_workout_params)
        @current_workout.user = current_user

        if @current_workout.save

          @current_workout.routine.routine_exercises.each do |re|
            exercise = re.exercise
            measure_input = re.reps.map{|i| 0}
            CurrentWorkoutExercise.create(current_workout:@current_workout, exercise: exercise, measure: re.measure, name: re.name, sets:re.sets, reps:re.reps, measure_input: measure_input)
          end
          render json: @current_workout
        else
          render json: {error: "Failed to create current workout"}, status: 401
        end
      else
        render json: {error: "This user already has an active workout."}, status: 409

      end

    else
      render json: {error: "Invalid Token: Must be logged in."}
    end
  end

  def add_exercise
    if current_user
      byebug
      @current_workout = CurrentWorkout.find(params["current_workout_id"])
      exercise = params["update"]
      CurrentWorkoutExercise.create(current_workout:@current_workout, exercise: exercise, measure: exercise.measure, name: exercise.name, sets:exercise.sets, reps:exercise.reps, measure_input: measure_input)
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
