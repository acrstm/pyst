class GroupsController < ApplicationController

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



def group_params
  params.require(:group).permit(:name)
end







  def join

  end

end
