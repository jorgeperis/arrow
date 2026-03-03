class UpdateShoesDistanceJob < ApplicationJob
  queue_as :default

  def perform(shoes_id)
    shoes = Shoes.find_by(id: shoes_id)

    shoes&.with_lock { shoes.update_distance! }
  end
end
