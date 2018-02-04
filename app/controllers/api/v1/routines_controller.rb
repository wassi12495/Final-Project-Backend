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

  end

  def update

  end

  def destroy

  end


  private

    def routine_params
    end
end
