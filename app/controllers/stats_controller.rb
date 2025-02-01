class StatsController < ApplicationController
  # GET /stats or /stats.json
  def index
    @stats = RunMark.order(time: :asc).group_by(&:distance)
    @chart_data = {
      labels: chart_months,
      datasets: pace_per_distance_for_all_months.each_with_index.map do |(distance, data), index|
        {
            label: helpers.decorated_distance_for(distance),
            borderColor: CHART_COLORS[index][:dark],
            backgroundColor: CHART_COLORS[index][:light],
            data: data.values
        }
      end
    }
  end

  private

  def chart_months
    @chart_months ||= Range.new(*RunMark.pluck(:date).minmax).map { |date| date.strftime("%B %Y") }.uniq
  end

  def pace_per_distance_and_month
    # {
    #   "5.0" =>
    #     {
    #       "January-2024" => 305,
    #       "February-2024" => 320,
    #       "May-2024" => 332,
    #       "September-2024" => 292,
    #       "January-2025" => 279
    #     },
    #   "10.0" =>
    #     {
    #       "May-2022" => 372,
    #       "January-2023" => 418,
    #       "May-2023" => 385,
    #       "January-2024" => 336,
    #       "December-2024" => 289,
    #       "January-2025" => 294
    #     },
    #   "21.097" =>
    #     { "October-2024" => 318 }
    # }

    COMMON_RACE_DISTANCES.keys.filter_map do |distance|
      run_marks = RunMark.where(distance:).order(date: :asc)

      next if run_marks.empty?

      grouped_data = run_marks.group_by { |run_mark| run_mark.date.strftime("%B %Y") }.map do |date, run_marks|
        { date => run_marks.map(&:pace).sum / run_marks.size }
      end

      { distance => grouped_data.reduce(:merge) }
    end.reduce(:merge)
  end

  def pace_per_distance_for_all_months
    pace_per_distance_and_month.map do |distance, months|
      { distance => fill_missing_months(chart_months, months) }
    end.reduce(:merge)
  end

  def fill_missing_months(months, data)
    filled_data = {}
    months.each_with_index do |month, index|
      if data.key?(month)
        filled_data[month] = data[month]
      else
        prev_month, next_month = find_surrounding_months(months, data.keys, index)

        filled_data[month] = if prev_month && next_month
          interpolate(data[prev_month], data[next_month], months.index(prev_month), months.index(next_month), index).round
        end
      end
    end
    filled_data
  end

  def find_surrounding_months(months, data_months, index)
    prev_month = data_months.select { |m| months.index(m) < index }.max_by { |m| months.index(m) }
    next_month = data_months.select { |m| months.index(m) > index }.min_by { |m| months.index(m) }
    [ prev_month, next_month ]
  end

  def interpolate(prev_value, next_value, prev_index, next_index, current_index)
    slope = (next_value - prev_value).to_f / (next_index - prev_index)
    prev_value + slope * (current_index - prev_index)
  end
end
