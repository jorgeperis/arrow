class Race < ApplicationRecord
  has_many :run_marks, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: [ :distance, :location ] }
  validates :location, presence: true
  validates :distance, presence: true, numericality: { greater_than: 0 }
  validates :homologated, inclusion: { in: [ true, false ] }

  def best_run_mark
    @best_run_mark ||= run_marks.order(time: :asc).first
  end
end
