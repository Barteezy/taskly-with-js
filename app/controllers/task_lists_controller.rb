class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.all
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(task: params[:task_list][:task])
    if @task_list.save
      flash[:notice] = "Task was created successfully"
      redirect_to task_lists_path
    else
      render :new
    end
  end
end