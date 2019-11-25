class Api::V1::TodosController < ApiController
  def index
    @todos = current_user.todos.all.order(created_at: :desc).page(params[:page])
  end
end
