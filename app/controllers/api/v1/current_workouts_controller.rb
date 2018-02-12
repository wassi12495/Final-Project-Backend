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
        render json: {errors: ["This user already has an active workout."]}, status: 409

      end

    else
      render json: {error: "Invalid Token: Must be logged in."}
    end
  end

  def add_exercise
    if current_user
      @current_workout = CurrentWorkout.find(params["current_workout_id"])
      exercise = params["update"]
      @exercise = Exercise.find(exercise["id"])
      ec= ExerciseCategory.find(@exercise['exercise_category_id'])
      subj = ec['subject_of_measurement']
      unit = ec['unit']
      measure = "#{subj} #{unit}"
      @current_workout_exercise = CurrentWorkoutExercise.new(current_workout:@current_workout, exercise_id: @exercise["id"], measure: measure, name: @exercise["name"], sets:1, reps:[0], measure_input: [0])
      if @current_workout_exercise.save
        render json: @current_workout_exercise
      else
        render json: {error: "Failed to create current workout exercise"}, status: 401
      end

    else
      render json: {error: "Invalid Token: Must be logged in."}
    end

  end

  def update
  end

  def destroy
    if current_user
      @current_workout = CurrentWorkout.find(params[:id])
      @current_workout.exercises.each do |exercise|
        CurrentWorkoutExercise.destroy(exercise.id)
      end
      CurrentWorkout.destroy(@current_workout.id)
      render json: {message: "Current Workout deleted."}
    else
      render json: {error: "You don't have permission to do that."}
    end
  end

  private
  def current_workout_params
    params.require(:current_workout).permit(:routine_id)

  end
end
