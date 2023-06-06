class TasksController < ApplicationController


  def index

    #   if params[:my_user]
     @tasks = Task.where(group_id: params[:group_id])

    #   @tasks = @group.tasks.map do |task|
    #     task.user_id == params[:my_user]
    #   end


    #   @upcoming_tasks = Task.where("deadline > ?", Date.today).where(user_id: params[:my_user]).where(group_id: @group.id)
    #   @missed_tasks = Task.where("deadline < ?", Date.today).where(user_id: params[:my_user]).where(group_id: @group.id)
    #   # @my_date = Date.parse(Date.today).strftime("%d/%m/%Y")
    # else
    #   @group = Group.find(current_user.group_id)
    #   @tasks = @group.tasks
    #   @upcoming_tasks = Task.where("deadline > ?", Date.today).where(user_id: current_user.id).where(group_id: @group.id)
    #   @missed_tasks = Task.where("deadline < ?", Date.today).where(user_id: current_user.id).where(group_id: @group.id)
    # end
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

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:name, :user_id, :done, :urgent, :comments, :deadline, :recurrence, :recurring)
  end


end
