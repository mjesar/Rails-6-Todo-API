class Api::V1::TodosController < ApiController
  before_action :set_todo, only: %i[show]

  def index
    @todos = current_user.todos.all.order(created_at: :desc).page(params[:page])
  end

  def show
    render :show
  end

  def create
    @todo = current_user.todos.new(todo_params)

    if @todo.save
      render :show, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :status)
  end
end
