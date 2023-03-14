class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def set_task
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task.save!
    redirect_to tasks_path
  end

  def show
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
