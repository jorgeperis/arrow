class Shoes < ApplicationRecord
  has_many :montly_distances, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
  validates :size, presence: true, numericality: { greater_than: 0 }
  validates :purchased_at, presence: true
  validates :distance, presence: true, numericality: { greater_or_equal_than: 0 }

  def update_distance!
    update_column(:distance, montly_distances.sum(:distance))
  end

  def distance_in_km
    (distance / 1000.0).to_s + " km"
  end

  def active?
    retired_at.nil?
  end

  def full_name
    brand + " " + model
  end
end
