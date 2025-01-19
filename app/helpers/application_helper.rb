module ApplicationHelper
  COMMON_DISTANCES = {
    "5000" => "5k",
    "10000" => "10k",
    "21097" => "21k",
    "42195" => "42k"
  }

  def decorated_distance_for(distance)
    COMMON_DISTANCES[distance.to_s] || "#{distance / 1000.0} km"
  end
end
