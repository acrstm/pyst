class GroupsController < ApplicationController

  def index
    group_ids = MultipleGroup.where(user:current_user).pluck(:group_id)
    @groups = Group.where(id: group_ids)
  end

  def show
    @group = Group.find(params[:id])
    @shopping_list =  @group.shopping_list
    find_user_ids = MultipleGroup.where(group: @group).pluck(:user_id)
    @group_members = User.where(id:find_user_ids)
    @group_tasks = @group.tasks
    @group_shopping_list = @group.shopping_list
    @bought_items = BoughtItem.where(shopping_list_id: @group_shopping_list.id )

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
    MultipleGroup.create(user_id: current_user.id, group_id: @group.id)
    ShoppingList.create(group: @group)
    @user.save
    redirect_to groups_path
  end



  def join

  end


  private

  def group_params
    params.require(:group).permit(:name, :description, :photo)
  end

end
