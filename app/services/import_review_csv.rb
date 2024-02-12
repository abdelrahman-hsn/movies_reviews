class ImportReviewCsv
  include ImportBase
  require 'csv'

  def initialize(file)
    @file = file
  end

  def call
    CSV.foreach(@file.path, headers: true) do |row|
      data = row.to_h
      Review.create!(
        movie: find_or_create_movie(data),
        user: find_or_create_user(data['User']),
        stars: data['Stars'],
        review_text: data['Review']
      )
    end
  end
end
