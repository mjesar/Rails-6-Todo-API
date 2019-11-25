class Api::V1::TodosController < ApiController
  def index
    render json: {"Hello": "Ji"}
  end
end
