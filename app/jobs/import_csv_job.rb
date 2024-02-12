class ImportCsvJob < ApplicationJob
  # include ImportBase

  queue_as :default
  def perform(movie, actor, city, country)
    add_actor_filming_location_country(movie, actor, city, country)

  rescue StandardError => e
    Rails.logger.error(message: e)
  end
end
