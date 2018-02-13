class Api::V1::ClientController < ApplicationController


  def accept_request
    if current_user
      trainer = User.find_by(username: params[:request][:trainer][:username])
      user = User.find(current_user[:id])
      user.update(trainer_id: trainer[:id])

      if user.authenticate(params[:password])
        user.update(password: params[:password], password_confirmation: params[:password])

        req = AddClientRequest.find_by(client_id: user[:id])
        req.destroy
        render json: {message: "#{trainer[:username]} is now your trainer!"}

      else
        byebug
        render json: {message: ["Still in development"]}
      end

    else

      render json: {errors: ["Must be an authenticated user."]}, status: 400

    end
  end





end
