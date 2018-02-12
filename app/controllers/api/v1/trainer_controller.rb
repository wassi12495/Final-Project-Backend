class Api::V1::TrainerController < ApplicationController


  def get_clients

    if current_user
      if current_user.is_trainer
        if !!current_user.clients
          @clients = current_user.clients.map do |client|
            {id: client.id, first_name: client.first_name, last_name:client.last_name, workouts: client.workouts}
          end
          render json: @clients
        else
          render json: {message: 'Trainer currently has no clients.'}
        end
      else
      render json: {message: 'User is not a trainer.'}
      end
    else
      render json: {error: "Must be logged in."}, status: 404
    end

  end

  def add_client

  end



end
