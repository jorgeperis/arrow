class Race < ApplicationRecord
  has_many :race_records, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :distance, presence: true, numericality: { greater_than: 0 }
  validates :homologated, inclusion: { in: [ true, false ] }
end
