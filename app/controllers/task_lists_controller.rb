class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.all
  end

  def new
    @task_list = TaskList.new
  end

  def edit
    @task_list= TaskList.find(params[:id])
  end

  def show
    @task_list = TaskList.find(params[:id])
  end

  def update
    @task_list = TaskList.find(params[:id])
    @task_list.update(task: params[:task_list][:task])
    if @task_list.save
      flash[:notice] = "Task was edited successfully"
      redirect_to root_path
    else
      render :edit
    end
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