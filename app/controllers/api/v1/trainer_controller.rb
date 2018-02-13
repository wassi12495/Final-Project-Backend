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

  def send_client_request
    if current_user
      client = User.find_by(username: params[:client][:username])
      req = AddClientRequest.new(trainer_id: current_user[:id], client_id: client[:id], message: params[:message])
      if req.save

        render json: {message: "Request to #{client[:username]} successfull."}
      else

        render json: req.error.full_messages

      end

    else
      render json: {errors: ["Must be logged in."]}, status: 404
    end
  end

  def add_client
    if current_user
      client = User.find_by(username: params[:client][:username])
      @client_req = AddClientRequest.new(trainer_id: current_user.id, client_id: client.id, message: params[:message])

      if @client_req.save()
        @trainer_req = AddTrainerRequest.new(trainer_id: current_user.id, client_id: client.id, message: params[:message])
        if @trainer_req.save()
          render json: @client_req
        else
          render json: @client_req.errors.full_messages
        end

      else
        render json: @client_req.errors.full_messages

      end

    else
      render json: {errord: ["Must be logged in."]}, status: 404
    end
  end



end
