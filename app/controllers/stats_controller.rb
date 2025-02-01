class StatsController < ApplicationController
  # GET /stats or /stats.json
  def index
    @stats = RunMark.order(time: :asc).group_by(&:distance)
  end
end
