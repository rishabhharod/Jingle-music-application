class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [:login]
  before_action :set_user

  def login
    if @user&.authenticate(params[:users][:password])
      token = jwt_encode(user_id: @user.id)
      render json: {message: 'Login successfully', token: token}, status: :ok
    else
      render json: {error: 'Invalid email or password'}, status: :unauthorized
    end
  end

  def destroy
    if @user
      render json: {message: 'Logout successfully'}, status: :ok
    else
      render json: {error: 'User not found'}, status: :not_fount
    end
  end 

  private
  def set_user
    @user = User.find_by(email: params[:users][:email])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
