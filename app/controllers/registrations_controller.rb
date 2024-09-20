class RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {message: 'User created successfully', user: user}, status: :created
    else
      render json: {errors: "User can not be created #{user.errors.full_messages}"}, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:users).permit(:email,:password,:name)
  end
end
