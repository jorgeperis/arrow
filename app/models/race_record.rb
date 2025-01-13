class RaceRecord < ApplicationRecord
  belongs_to :race, optional: false

  validates :edition, presence: true, uniqueness: { scope: :race_id }
  validates :date, presence: true
  validates :time, presence: true, numericality: { greater_than: 0 }
  validates :custom_distance, numericality: { greater_than: 0 }, allow_nil: true
  validates :custom_homologated, inclusion: { in: [ true, false ] }, allow_nil: true
end
