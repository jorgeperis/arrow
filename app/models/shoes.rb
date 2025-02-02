class Shoes < ApplicationRecord
  MAX_KM_TO_RETIRE = 1000.freeze

  has_many :montly_distances, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
  validates :size, presence: true, numericality: { greater_than: 0 }
  validates :purchased_at, presence: true
  validates :distance, presence: true, numericality: { greater_or_equal_than: 0 }

  scope :ordered, -> { order(purchased_at: :desc) }
  scope :active, -> { where(retired_at: nil) }

  def update_distance!
    update_column(:distance, montly_distances.sum(:distance))
  end

  def active?
    retired_at.nil?
  end

  def full_name
    brand + " " + model
  end

  def estimated_retired_at
    return Date.today if distance >= MAX_KM_TO_RETIRE

    montly_distances = MontlyDistance.where(month: 7.months.ago..)
    average_distance_per_day = (montly_distances.sum(:distance) / 6.0) / (365.0 / 12)
    Date.today + ((MAX_KM_TO_RETIRE - distance) / average_distance_per_day).round.days
  end
end
