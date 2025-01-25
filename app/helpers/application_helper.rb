module ApplicationHelper
  # Certified road races. source: https://worldathletics.org/
  COMMON_DISTANCES = {
    "1.609" => "1M",
    "5.0" => "5K",
    "10.0" => "10K",
    "21.097" => "Half marathon",
    "35.0" => "35K",
    "42.195" => "Marathon",
    "50.0" => "50K",
    "100.0" => "100K"
  }

  def decorated_distance_for(distance)
    COMMON_DISTANCES[distance.to_s] || "#{distance} km"
  end
end
