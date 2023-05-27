class TasksController < ApplicationController


  def index
    @tasks = Task.all

    @upcoming_tasks = Task.where("deadline > ?", Date.today)
    @missed_tasks = Task.where("deadline < ?", Date.today)
    
  end

  def new
    @group = Group.find(current_user.group_id)
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

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:name, :user_id, :done, :urgent, :comments, :deadline, :recurrence, :recurring)
  end


end
