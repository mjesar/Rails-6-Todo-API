class Api::V1::TodosController < ApiController
  def index
    @todos = current_user.todos.all
  end
end
