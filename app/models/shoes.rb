class Shoes < ApplicationRecord
  has_many :montly_distances, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
  validates :size, presence: true, numericality: { greater_than: 0 }
  validates :purchased_at, presence: true
  validates :distance, presence: true, numericality: { greater_or_equal_than: 0 }

  def active?
    retired_at.nil?
  end

  def update_distance!
    self.distance = montly_distances.sum(:distance)
    save!
  end
end
