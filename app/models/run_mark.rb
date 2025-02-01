class RunMark < ApplicationRecord
  belongs_to :race, counter_cache: true

  validates :edition, presence: true, uniqueness: { scope: :race_id }
  validates :date, presence: true
  validates :time, presence: true, numericality: { greater_than: 0 }
  validates :distance, numericality: { greater_than: 0 }
  validates :homologated, inclusion: { in: [ true, false ] }
  validates :source, presence: true

  before_validation :set_defaults_from_race, on: :create

  scope :ordered, -> { order(date: :desc) }

  def full_name
    edition.to_s + "ª " + race.name
  end

  def pace
    (time / distance).round
  end

  def time_hours
    time / 3600
  end

  def time_minutes
    (time % 3600) / 60
  end

  def time_seconds
    time % 60
  end

  private

  def set_defaults_from_race
    self.distance ||= race.distance
    self.homologated ||= race.homologated
  end
end
