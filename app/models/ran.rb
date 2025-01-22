class Ran < ApplicationRecord
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

  def time_in_minutes
    minutes = time / 60
    seconds = time % 60

    "#{minutes.to_i}'#{seconds.to_i.to_s.rjust(2, '0')}''"
  end

  def pace
    seconds_per_km = (1000 * time) / distance

    minutes = seconds_per_km / 60
    seconds = seconds_per_km % 60

    "#{minutes.to_i}'#{seconds.to_i.to_s.rjust(2, '0')}''"
  end

  private

  def set_defaults_from_race
    self.distance ||= race.distance
    self.homologated ||= race.homologated
  end
end
