class UpdateShoesDistanceJob < ApplicationJob
  queue_as :default

  def perform(shoes_id)
    shoes = Shoes.find_by(id: shoes_id)

    if shoes.nil?
      Rails.logger.warn "Shoes with id #{shoes_id} not found. Skipping distance update."
    else
      shoes&.with_lock { shoes.update_distance! }

      Rails.logger.info "Updated distance for Shoes with id #{shoes_id}."
    end
  end
end
