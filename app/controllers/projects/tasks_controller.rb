class Projects::TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:show, :new, :create, :edit, :update, :destroy]

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = @project_id
    respond_to do |formate| 
      if @task.save
        formate.html { redirect_to project_url(@task.project_id), notice: "Task was created successfully!"}
        formate.json { render :show, status: :created, location: @task}
      else
        formate.html { render :new}
        formate.json { render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |formate| 
      if @task.update(task_params)
        formate.html { redirect_to project_url(@task.project_id), notice: "Task was updated successfully!"}
        formate.json { render :show, status: :created, location: @task}
      else
        formate.html { render :edit}
        formate.json { render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |formate|

    formate.html { redirect_to project_url(@task.project_id), notice: "Task was deleted successfully!"}
    formate.json {head :no_content }
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end
    
    def set_project
      @project = Project.find(params[:project_id]) 
      #如果url是 .com/project/5/task/2 ，這邊就會找尋project_id為5的project
    end

    def task_params
      params.require(:task).permit(:title, :description, :project_id,
       :completed, :task_file)
    end
  end
end
