class Goal < ApplicationRecord
  belongs_to :user

  validates :distance, presence: true, numericality: { greater_than: 0 },
    uniqueness: { scope: :user_id }
  validates :target_time, presence: true, numericality: { greater_than: 0 }

  scope :ordered, -> { order(:distance) }

  def name
    COMMON_RACE_DISTANCES[distance.to_s]&.fetch(:name) || "#{distance} km"
  end

  def target_time_formatted
    return if target_time.blank?

    format("%d:%02d:%02d", target_time / 3600, (target_time % 3600) / 60, target_time % 60)
  end

  def target_time_formatted=(value)
    self.target_time = Run.seconds_from_formatted(value)
  end

  # Fastest run the user has logged at this goal's distance, or nil.
  def best_run
    @best_run ||= user.runs.where(distance: distance).order(:time).first
  end

  def achieved?
    best_run.present? && best_run.time <= target_time
  end

  # 0.0–1.0 proximity of the current best to the target (faster best => closer to 1).
  def progress
    return 0.0 if best_run.nil?
    return 1.0 if achieved?

    (target_time.to_f / best_run.time).clamp(0.0, 1.0)
  end
end
