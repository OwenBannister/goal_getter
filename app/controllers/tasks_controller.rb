class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html
  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @goal = Goal.find(params[:goal_id])
    respond_to do |format|               
      format.js
    end        
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.save!
     @goal = Goal.find_by_id @task.goal_id
    @tasks = @goal.tasks
 respond_to do |format|
    format.js do
    end
  end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :completion_date, :start_date, :money_available, :goal_id)
    end
  end
