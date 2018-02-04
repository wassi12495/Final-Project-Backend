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
    byebug
    @routine = Routine.new(routine_params)
    if @routine.save
      render json: @routine
    else
      render json: {error:"Routine Invalid"}, status: 401

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
