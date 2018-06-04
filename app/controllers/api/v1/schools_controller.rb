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

  def create
    @school = School.create(school_params)

    if @school.error.any?
      render json: {success: false, errors: @school.errors.messages}.to_json, status: 422
    else
      render template: 'api/v1/schools/show', status: 201
    end
  end

  def destroy
    school = School.find(params[:id])
    if(school)
      school.destroy
      @school = school
    else
      render json: {success: false, errors: @school.errors.messages}.to_json, status: 422
    end
  end

  private

  def school_params
    params.require(:school).permit(
      :name,
      :address,
      :city,
      :zip_code,
      :latitude,
      :longitude,
      :status,
      :student_number,
      :opening_hours,
      :phone_number,
      :email
    )
  end

end
