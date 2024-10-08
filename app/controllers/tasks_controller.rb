class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.merge(status: false)) 
    if @task.save
      flash[:notice] = "Task was successfully created."
      redirect_to tasks_path
    else
      flash[:alert] = "There was an error creating the task."
      render :index
    end
  end

  def complete
    @task = Task.find(params[:id])

    if @task.update(status: true) 
      flash[:notice] = "Task was marked as complete!"
    else
      flash[:alert] = "There was an error marking the task as complete."
    end

    redirect_to tasks_path
  end

  def undo
    @task = Task.find(params[:id])

    if @task.update(status: false) 
      flash[:notice] = "Task was marked as incomplete!"
    else
      flash[:alert] = "There was an error marking the task as incomplete."
    end

    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task was successfully deleted."
    else
      flash[:alert] = "There was an error deleting the task."
    end
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
