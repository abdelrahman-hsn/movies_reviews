class Movie < ApplicationRecord
  belongs_to :director
  has_many :reviews, dependent: :destroy

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :movie_countries
  has_many :countries, through: :movie_countries

  has_many :movie_cities
  has_many :cities, through: :movie_cities

  scope :filtered, ->(value) { public_send("filter_by_actor_name", value).public_send("filter_by_sort_rating") if value.present?}
  scope :filter_by, ->(key, value) { public_send("filter_by_#{key}", value) if value.present?}
  scope :filter_by_sort_rating, -> {
    select('movies.*, AVG(reviews.stars) AS average_stars')
      .left_joins(:reviews)
      .group('movies.id')
      .order('average_stars DESC NULLS LAST')
  }
  scope :filter_by_actor_name, ->(actor_name) { joins(:actors).where('users.name ILIKE ?', "%#{actor_name}%").distinct }
end
