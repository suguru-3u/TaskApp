class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_path
  end

  def edit
  end

  private
  def task_params
    params.require(:task).permit(:name,:body)
  end

end
