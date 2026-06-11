class Tag < ApplicationRecord
  COLORS = %w[
    #ef4444 #f97316 #d97706 #22c55e #14b8a6
    #3b82f6 #6366f1 #a855f7 #ec4899 #0ea5e9
    #10b981 #f43f5e
  ].freeze

  belongs_to :user
  has_many :run_tags, dependent: :destroy
  has_many :runs, through: :run_tags

  validates :name, presence: true, uniqueness: { scope: :user_id, case_sensitive: false }

  before_create { self.color = COLORS.sample }

  scope :ordered, -> { order(:name) }
end
