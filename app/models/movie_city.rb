class MovieCity < ApplicationRecord
  belongs_to :movie
  belongs_to :city
end
