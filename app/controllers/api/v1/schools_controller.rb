class Api::V1::SchoolsController < Api::ApiController

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :GET, '/v1/schools', 'List schools'
  param :headers, :boolean do
    param :HTTP_AUTHORIZATION, :boolean
  end
  error code: 401
  def index
    render json: {success: true}
  end

end
