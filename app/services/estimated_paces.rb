class EstimatedPaces
  def self.for(run_mark, distances = FAVOURITE_RACE_DISTANCES.keys)
    self.new(run_mark, distances).calculate
  end

  def initialize(run_mark, distances)
    @run_mark = run_mark
    @distances = distances
  end

  def calculate
    @distances.each_with_object({}) do |distance, result|
      result[distance] = calculate_time(distance)
    end
  end

  private

  def calculate_time(distance)
    # Riegel Formula: https://en.wikipedia.org/wiki/Peter_Riegel
    @run_mark.time * ((distance.to_f / @run_mark.distance) ** 1.06)
  end
end
