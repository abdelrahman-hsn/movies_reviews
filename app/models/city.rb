class City < ApplicationRecord
  has_many :movie_cities
  has_many :movies, through: :movie_cities
end
