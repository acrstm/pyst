class TasksController < ApplicationController


  def index
    @tasks = Task.all
  end

  def new
    @group = Group.find(params[:group_id])
    @task = Task.new # Needed to instantiate the form_with
  end


  def create
    @task = Task.new(task_params)
    @group = Group.find(params[:group_id])
    @task.group = @group
    # @user = current_user
    # @task.user = @user

    @task.save

    redirect_to group_task_path(@group, @task) # group_id task_id
  end

  private

  def task_params
    params.require(:task).permit(:name, :user_id, :done, :urgent, :comments, :deadline, :recurrence, :recurring)
  end

  def show

  end
end
