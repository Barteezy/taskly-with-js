class TasksController < ApplicationController

  def new
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new
  end

  def create
    p params
    @task = Task.new(description: params[:task][:description], task_list_id: params[:task_list_id])
    if @task.save
    redirect_to root_path

  end
end