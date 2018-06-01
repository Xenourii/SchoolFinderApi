class Api::V1::SessionsController < Api::ApiController
  skip_before_action :require_login!, only: :create

  def create
    user = User.find_by(email: params[:email])

    if user.valid_password?(params[:password])
      render json: {success: true, auth_token: user.generate_token}
    else
      render json: {success: false}, status: 401
    end
  end

end
