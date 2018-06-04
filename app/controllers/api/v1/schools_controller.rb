class Api::V1::SchoolsController < Api::ApiController

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :GET, '/v1/schools', 'List schools'
  param :headers, :boolean do
    param :HTTP_AUTHORIZATION, :boolean
  end
  error code: 401
  def index
    @schools = School.filter(params)
  end

  def show
    @school = School.find(params[:id])
  end

  def destroy
    School.find(params[:id]).destroy
  end

end
