class Current < ActiveSupport::CurrentAttributes
  attribute :session
  delegate :user, to: :session, allow_nil: true

  delegate :shoes, to: :user, allow_nil: true
end
