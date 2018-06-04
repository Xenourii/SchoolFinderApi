class Api::V1::SchoolsController < Api::ApiController

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :GET, '/v1/schools', 'Liste des écoles'
  param :headers, :boolean do
    param :HTTP_AUTHORIZATION, :boolean
  end
  param :status, :undef
  error code: 401
  def index
    @schools = School.filter(params)
  end

  api :GET, '/v1/schools/:id', 'Afficher une école'
  def show
    @school = School.find(params[:id])
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :POST, '/v1/schools', 'Créer une école'
  error code: 422
  def create
    @school = School.create(school_params)

    if @school.errors.any?
      render json: {success: false, errors: @school.errors.messages}.to_json, status: 422
    else
      render template: 'api/v1/schools/show', status: 201
    end
  end

  api :PATCH, '/v1/schools/:id', 'Mettre à jour une école'
  api :PUT, '/v1/schools/:id', 'UMettre à jour une école'
  error code: 422
  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      render template: 'api/v1/schools/show', status: 200
    else
      render json: {succes: false, errors: @school.errors.messages}.to_json, status: 422
    end
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :DELETE, '/v1/schools/:id', 'Supprimer une école'
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
