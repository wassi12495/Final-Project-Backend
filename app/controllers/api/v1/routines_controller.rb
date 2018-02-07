class Api::V1::RoutinesController < ApplicationController

  def index
    @routines = Routine.all
    render json: @routines

  end

  def show
    @routine = Routine.find(params[:id])
    render json: @routine
  end

  def create
    @routine = Routine.new(routine_params)

    if @routine.save
      params["routine"]["exercises"].each do |e|
        @exercise = Exercise.find_by(id: e["id"])
        reps = e["sets"].map{|s| s["reps"]}
        measure = "#{e["exercise_category"]["subject_of_measurement"]} (#{e["exercise_category"]["unit"]}) "

        RoutineExercise.create(routine: @routine, exercise: @exercise, name: e[:name], description: e[:description], sets: e["sets"].last["set"], reps: reps, measure:measure)
      end
    
      render json: @routine
    else
      render json: {error: @routine.errors.messages }, status: 401
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
