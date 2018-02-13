class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    @users = users.map do |user|
      {username: user.username, first_name: user.first_name, last_name:user.last_name}

    end
    render json: @users
  end

  # TODO: I don't know if I will need this
  def show

  end

  def create

     @user = User.new(user_params)

     @user.password = params[:password]
     @user.password_confirmation = params[:password_confirmation]
     # @user =  User.new(username: params[:username], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], is_trainer: params[:is_trainer])

    if @user.save
      render json: {username: @user.username, first_name: @user.first_name, last_name:@user.last_name}
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  def get_notifications
    if current_user

      if current_user.is_trainer
        # User is trainer
        render json: {message: "Still in development."}

      else
        #  User is client
        reqs = AddClientRequest.where(client_id: current_user[:id])
        @reqs = reqs.map do |r|
          trainer = User.find(r[:trainer_id])

            {trainer:
              {username: trainer[:username], first_name: trainer[:first_name], last_name: trainer[:last_name] },
              message: r[:message],
              request_id: r[:id]
            }

        end
        render json: @reqs
      end
    else

      render json: {errors: ["Must be an authenticated user."]}, status: 400
    end

  end
  # TODO: User in updating user profile
  def update
  end

  # TODO: Later, allows users to remove all their personal data & account
  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :is_trainer)
  end
end
