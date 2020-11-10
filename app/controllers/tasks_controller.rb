class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path(@task)
  end

  def edit
    @task = set_task_by_id
  end

  def update
    @task = set_task_by_id
    @task.update(task_params)

    redirect_to tasks_path(@task)
  end

  def destroy
    @task = set_task_by_id
    @task.destroy

    redirect_to tasks_path
  end

  private

  def set_task_by_id
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:details, :title)
  end

end
