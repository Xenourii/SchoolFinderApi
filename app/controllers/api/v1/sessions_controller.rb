class Api::V1::SessionsController < Api::ApiController
  skip_before_action :require_login!, only: :create

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :POST, '/v1/users/sign_in', 'Obtenir le token de session'
  error code: 401
  def create
    user = User.find_by(email: params[:email])

    if user.valid_password?(params[:password])
      render json: {success: true, auth_token: user.generate_token}
    else
      render json: {success: false}, status: 401
    end
  end

end
