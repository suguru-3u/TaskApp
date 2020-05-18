class TasksController < ApplicationController

  def new
    @task = Task.new
    @tasks = Task.last(3)
  end

  def index
    @today = Date.today
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
     redirect_to new_task_path
   else
     @tasks = Task.all
     render :new
   end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
  	@task = Task.find(params[:id])
  	if @task.update(task_params)
  		redirect_to edit_task_path(@task), notice: "successfully updated task!"
  	else
  		render :edit
  	end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "successfully delete task!"
  end

  private
  def task_params
    params.require(:task).permit(:name,:body,:end_date)
  end

end
