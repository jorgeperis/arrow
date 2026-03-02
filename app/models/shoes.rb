class Shoes < ApplicationRecord
  MAX_KM_TO_RETIRE = 1000.freeze

  belongs_to :user

  has_many :montly_distances, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
  validates :size, presence: true, numericality: { greater_than: 0 }
  validates :purchased_at, presence: true
  validates :distance, presence: true, numericality: { greater_or_equal_than: 0 }

  scope :ordered, -> { order(purchased_at: :desc) }
  scope :active, -> { where(retired_at: nil).order(updated_at: :desc) }

  def update_distance!
    update_column(:distance, montly_distances.sum(:distance).round(2))
  end

  def active?
    retired_at.nil?
  end

  def full_name
    brand + " " + model
  end
end
