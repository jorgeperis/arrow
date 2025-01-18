class MontlyDistance < ApplicationRecord
  belongs_to :shoes
  validates :month, presence: true, uniqueness: { scope: :shoes_id }
  validates :distance, presence: true

  after_commit -> { shoes.update_distance! }
end
