class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @list.tasks
  end

  def show
  end

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to board_lists_path(@list.board, @list.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @task.destroy
    redirect_to board_lists_path(@list.board, @list.id)
  end

  private
  def task_params
    params.require(:task).permit(:name)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end



end
