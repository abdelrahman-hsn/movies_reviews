class ImportMovieCsv
  include ImportBase
  require 'csv'

  def initialize(file)
    @file = file
  end

  def call
    CSV.foreach(@file.path, headers: true) do |row|
      data = row.to_h
      movie = find_or_create_movie(data)
      actor = find_or_create_actor(data['Actor'])
      city = find_or_create_filming_location(data['Filming location'])
      country = find_or_create_country(data['Country'])
      ImportCsvJob.perform_later(movie, actor, city, country)
    end
  end
end
