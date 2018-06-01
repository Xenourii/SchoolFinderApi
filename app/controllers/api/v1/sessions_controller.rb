class Api::V1::SessionsController < ApplicationController

  def create
    render json: {success: true}.to_json
  end

end
