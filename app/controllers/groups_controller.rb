class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user
    @user = current_user
    @groups = @user.groups
  end

  def index
    @user = current_user
    @group = @user.groups
  end

  def show
    @group = Group.find(params[:id])
    @user = @group.users
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

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [] )
  end
end
