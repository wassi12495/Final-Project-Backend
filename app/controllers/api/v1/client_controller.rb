class Api::V1::ClientController < ApplicationController


  def accept_request
    if current_user

      byebug

      render json: {message: ["Still in development"]}

    else

      render json: {errors: ["Must be an authenticated user."]}, status: 400

    end
  end





end
