class Actor < User

  has_many :movie_actors
  has_many :movies, through: :movie_actors

  after_initialize :set_type

  private

  def set_type
    self.type = "Director" if new_record?
  end
end
