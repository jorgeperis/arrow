class GoalsController < ApplicationController
  before_action :set_goal, only: %i[ edit update destroy ]

  def index
    @goals = current_user.goals.ordered
    @goal = current_user.goals.new
  end

  def new
    @goal = current_user.goals.new
  end

  def edit
  end

  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      redirect_to goals_path, notice: "Goal was successfully created."
    else
      @goals = current_user.goals.ordered
      render :index, status: :unprocessable_entity
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path, notice: "Goal was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy!
    redirect_to goals_path, status: :see_other, notice: "Goal was successfully destroyed."
  end

  private

  def set_goal
    @goal = current_user.goals.find(params.expect(:id))
  end

  def goal_params
    params.expect(goal: [ :distance, :target_time_formatted ])
  end
end
