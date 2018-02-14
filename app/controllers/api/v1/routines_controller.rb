class Api::V1::RoutinesController < ApplicationController

  def index

    if current_user
      seed_routines = Routine.where(user_id: nil)
      user_routines = Routine.where(user_id: current_user.id)
      routines = seed_routines + user_routines
      @routines = routines.map do |routine|
        {id: routine.id, title:  routine.title, exercises: routine.routine_exercises, workouts: routine.workouts}
      end
      render json:  @routines
    else
      render json: {message: "Must be logged in."}
    end
  end

  def show
    @routine = Routine.find(params[:id])
    render json: @routine
  end

  def create
    if current_user

      @routine = Routine.new(routine_params)
      if params[:routine][:exercises].length == 0
        render json: {errors: ["Routines must have exercises"] }, status: 401
      elsif @routine.save
        params["routine"]["exercises"].each do |e|
          @exercise = Exercise.find_by(id: e["id"])
          reps = e["sets"].map{|s| s["reps"]}
          measure = "#{e["exercise_category"]["subject_of_measurement"]} (#{e["exercise_category"]["unit"]}) "

          RoutineExercise.create(routine: @routine, exercise: @exercise, name: e[:name], description: e[:description], sets: e["sets"].last["set"], reps: reps, measure:measure)
        end
        routine = {id: @routine.id, title:  @routine.title, exercises: @routine.routine_exercises, workouts: @routine.workouts}
        render json: routine
      else
        render json: {errors: @routine.errors.full_messages }, status: 401
      end
    else
      render json: {error: "Failed to authenticate user."}, status: 404
    end

  end

  def update

  end

  def destroy

  end


  private

    def routine_params
      params.require(:routine).permit(:title, :user_id)
    end
end
