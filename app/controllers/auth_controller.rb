class AuthController < ApplicationController
  before_action :authenticate_user!, only: [ :me, :logout ]

  # POST /auth/register
  def register
    user = User.new(sign_up_params)
    if user.save
     #  sign_in(user)
     render json: { user: user }, status: :created
    else
     render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /auth/login
  def login
    user = User.find_for_database_authentication(email: params[:email])
    if user&.valid_password?(params[:password])
      # sign_in(user)
      render json: { user: user }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  # GET /auth/me
  def me
    render json: { user: current_user }, status: :ok
  end

  # DELETE /auth/logout
  def logout
    # sign_out(current_user)
    head :no_content
  end

  private

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
