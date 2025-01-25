class MontlyDistance < ApplicationRecord
  belongs_to :shoes
  validates :month, presence: true, uniqueness: { scope: :shoes_id }
  validates :distance, presence: true

  # TODO: Send a Job to be managed by solid_queue
  after_commit -> { shoes.update_distance! }

  scope :ordered, -> { order(month: :desc) }
end
