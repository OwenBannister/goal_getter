class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy, :start, :complete]

  # GET /goals
  def index
    @goals = Goal.all
  end

  # GET /goals/1
  def show
    @tasks = @goal.get_open_tasks
  end

  def show_tasks
    set_goal
    @tasks = @goal.get_open_tasks
        respond_to do |format|               
      format.js
    end      
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      redirect_to :partial => 'goal', :object => @goal, notice: 'Goal was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /goals/1
  def update
    if @goal.update(goal_params)
      redirect_to @goal, notice: 'Goal was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy
    redirect_to goals_url, notice: 'Goal was successfully destroyed.'
  end
 

  def start
    @goal.start!
    @tasks = @goal.get_open_tasks
    redirect_to goal_url(@goal), notice: 'Goal was successfully started.'
  end

  def complete
    @goal.complete!
    @tasks = @goal.get_open_tasks
    redirect_to goals_url, notice: 'Goal was successfully completed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def goal_params
      params.require(:goal).permit(:name, :description, :task_id, :workflow_state)
    end
end
