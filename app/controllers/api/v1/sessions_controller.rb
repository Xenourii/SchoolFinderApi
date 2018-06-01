class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user.valid_password?(params[:password])
      render json: {success: true, auth_token: user.generate_token}
    else
      render json: {success: false}, status: 401
    end
  end

end
