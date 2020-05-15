class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
     redirect_to tasks_path
   else
     @tasks = Task.all
     render :index
   end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
  	@task = Task.find(params[:id])
  	if @task.update(task_params)
  		redirect_to edit_task_path(@task), notice: "successfully updated user!"
  	else
  		render :edit
  	end
  end

  def destroy
    @task = Task.find(params[:id])
  end

  private
  def task_params
    params.require(:task).permit(:name,:body)
  end

end
