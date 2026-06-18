class AgeGrading
  # Loads WMA age-standard times from config/age_grading.yml. Until that file is
  # populated with official data, scoring returns nil rather than guessing.
  FACTORS_PATH = Rails.root.join("config", "age_grading.yml")

  class << self
    def data
      @data ||= load_data
    end

    def reload!
      @data = load_data
    end

    def available?
      data["standards"].present?
    end

    def for(run, user)
      new(run, user).score
    end

    private

    def load_data
      return {} unless FACTORS_PATH.exist?

      YAML.safe_load_file(FACTORS_PATH) || {}
    rescue StandardError
      {}
    end
  end

  def initialize(run, user)
    @run = run
    @user = user
  end

  # Age-graded percentage (standard_time / actual_time * 100), or nil when the
  # coefficient data or the user's profile is incomplete.
  def score
    return nil unless self.class.available?
    return nil unless @user&.profile_complete?

    standard = standard_time
    return nil if standard.nil? || @run.time.to_i.zero?

    (standard.to_f / @run.time * 100).round(1)
  end

  private

  def standard_time
    age = @user.age_on(@run.date)
    return nil if age.nil?

    self.class.data.dig("standards", @user.gender, @run.distance.to_s, age.to_s)
  end
end
