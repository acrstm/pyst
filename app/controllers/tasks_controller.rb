class TasksController < ApplicationController


  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end


  def create
    @task = Task.new(task_params)
    # @user = current_user
    # @task.user = @user

    @task.save
    redirect_to tasks_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:name, :user_id, :done, :urgent, :comments, :deadline, :recurrence, :recurring)
  end

  def show

  end
end
