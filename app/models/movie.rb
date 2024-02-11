class Movie < ApplicationRecord
  belongs_to :director
  has_many :reviews, dependent: :destroy

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :movie_countries
  has_many :countries, through: :movie_countries

  has_many :movie_cities
  has_many :cities, through: :movie_cities
end
