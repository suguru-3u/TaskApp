class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user
    @user = current_user
    @groups = @user.groups
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
    @projects = @group.projects
    @project = Project.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to new_group_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
  		redirect_to new_group_path
  	else
  		render :edit
  	end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to new_group_path, notice: "successfully delete task!"
  end


  private
  def group_params
    params.require(:group).permit(:name, user_ids: [] )
  end
end
