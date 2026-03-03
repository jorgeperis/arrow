class MontlyDistance < ApplicationRecord
  belongs_to :shoes
  validates :month, presence: true, uniqueness: { scope: :shoes_id }
  validates :distance, presence: true

  after_commit -> { UpdateShoesDistanceJob.perform_later(shoes_id) }

  scope :ordered, -> { order(month: :desc) }
end
