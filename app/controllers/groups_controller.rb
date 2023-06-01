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

  end


  private

  def group_params
    params.require(:group).permit(:name, :description, :photo)
  end

end
