class Api::V1::RoutinesController < ApplicationController

  def index
    @routines = Routine.all 
    render json: @routines

  end

  def show

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
