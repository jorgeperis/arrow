module RacesHelper
  def races_grouped_options
    Race.ordered_by_distance.group_by(&:distance).map do |distance, races|
      [ decorated_distance_for(distance), races.pluck(:name, :id) ]
    end
  end
end
