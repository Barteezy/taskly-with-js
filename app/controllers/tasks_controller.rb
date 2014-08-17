class TasksController < ApplicationController

  def new
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new
    @task.task_list_id = params[:id]
  end

  def create
    p params
    @task = Task.new
    @task.description = params[:task][:description]
    @task.task_list_id = params["task_list_id"]
    @task.date = Date.new(params["date"]["year"].to_i, params["date"]["month"].to_i, params["date"]["day"].to_i)
    if @task.save
      flash[:notice] = "Task was created successfully"
      redirect_to root_path
    else
      flash[:error] = "Your task could not be created"
      redirect_to new_task_list_task_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task was deleted successfully"
    redirect_to root_path
  end
end