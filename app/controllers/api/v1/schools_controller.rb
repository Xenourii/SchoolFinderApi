class Api::V1::SchoolsController < Api::ApiController

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :GET, '/v1/schools', 'List schools'
  param :headers, :boolean do
    param :HTTP_AUTHORIZATION, :boolean
  end
  param :status, :undef
  error code: 401
  def index
    @schools = School.filter(params)
  end

  def show
    @school = School.find(params[:id])
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :POST, '/v1/schools', 'Create a school'
  error code: 422
  def create
    @school = School.create(school_params)

    if @school.errors.any?
      render json: {success: false, errors: @school.errors.messages}.to_json, status: 422
    else
      render template: 'api/v1/schools/show', status: 201
    end
  end

  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      render template: 'api/v1/schools/show', status: 200
    else
      render json: {succes: false}.to_json, status: 422
    end
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :DELETE, '/v1/schools/:id', 'Destroy a school'
  def destroy
    @school = School.find(params[:id])
    if(@school.destroy)
      render template: 'api/v1/schools/show', status: 200
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
