class UpdateDistanceColumns < ActiveRecord::Migration[8.0]
  def change
    add_column :shoes, :distance_km, :float, default: 0, null: false
    add_column :montly_distances, :distance_km, :float, default: 0, null: false
    add_column :rans, :distance_km, :float, default: 0, null: false
    add_column :races, :distance_km, :float, default: 0, null: false

    Shoes.find_each do |shoes|
      shoes.update_column(:distance_km, shoes.distance / 1000.0)
    end

    MontlyDistance.find_each do |montly_distance|
      montly_distance.update_column(:distance_km, montly_distance.distance / 1000.0)
    end

    Ran.find_each do |ran|
      ran.update_column(:distance_km, ran.distance / 1000.0)
    end

    Race.find_each do |race|
      race.update_column(:distance_km, race.distance / 1000.0)
    end

    remove_column :shoes, :distance
    remove_column :montly_distances, :distance
    remove_column :rans, :distance
    remove_column :races, :distance

    rename_column :shoes, :distance_km, :distance
    rename_column :montly_distances, :distance_km, :distance
    rename_column :rans, :distance_km, :distance
    rename_column :races, :distance_km, :distance
  end
end
