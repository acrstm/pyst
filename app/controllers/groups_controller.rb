class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    @user = current_user
    # @task.user = @user

    @group.save
    @user.group_id = @group.id
    @user.save
    redirect_to group_path(@group)
  end

  def show
    @group = Group.find(params[:id])
    @photo = @group.photo.key
  end

  def join
    @groups = Group.where.not(id: current_user.group_id)
  end

  def join_group
    @group = Group.find(params[:user][:group_id])
    current_user.group = @group

    if current_user.save

      redirect_to group_path(@group)
    else
      redirect_to join_groups_path
    end
  end


  private

  def group_params
    params.require(:group).permit(:name, :description, :photo)
  end

end
