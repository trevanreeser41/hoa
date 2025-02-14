module Api
  module V1
    class AuthController < ApplicationController
      def login
        user = User.find_by(email: params[:email])
        if user&.valid_password?(params[:password])
          render json: {
            token: generate_jwt(user),
            user: user.as_json(only: [:id, :email, :role])
          }
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end
      
      private
      
      def generate_jwt(user)
        JWT.encode(
          { user_id: user.id, exp: 60.days.from_now.to_i },
          Rails.application.credentials.secret_key_base
        )
      end
    end
  end
end 