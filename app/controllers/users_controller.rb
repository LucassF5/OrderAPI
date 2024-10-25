class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def create
    @user = User.create!(user_params)
    @token = encode_token(user_id: @user.id)
    Rails.logger.info("\nUser created, user_id: #{@user.id}")
    render json: {
        user: UserSerializer.new(@user),
        token: @token
      }, status: :created
  end

  def me
    render json: current_user, status: :ok
  end

  def update
    if current_user.update(user_params)
      render json: { user: UserSerializer.new(current_user) }
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
    Rails.logger.info("\nUser deleted: #{current_user}")
    render json: { message: "User deleted" }, status: :no_content
  end

  private

  def user_params
    params.permit(:username, :email, :password, :phone_number, :isLoja)
  end

  def handle_invalid_record (e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

end
