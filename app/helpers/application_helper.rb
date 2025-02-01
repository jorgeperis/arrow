module ApplicationHelper
  def decorated_distance_for(distance)
    COMMON_RACE_DISTANCES[distance.to_s] || distance_in_km(distance)
  end

  def distance_in_km(distance)
    distance.to_s + " km"
  end

  def decorated_time_for(time)
    hours = time / 3600
    minutes = (time % 3600) / 60
    seconds = time % 60

    result = "#{minutes.to_i}'#{seconds.to_i.to_s.rjust(2, '0')}''"

    hours > 0 ? "#{hours}h#{result}" : result
  end
end
