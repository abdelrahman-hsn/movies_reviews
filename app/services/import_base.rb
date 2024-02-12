module ImportBase
  def find_or_create_director(name)
    Director.find_or_create_by(name: name)
  end

  def find_or_create_actor(name)
    Actor.find_or_create_by(name: name)
  end

  def find_or_create_filming_location(name)
    City.find_or_create_by(name: name)
  end

  def find_or_create_country(name)
    Country.find_or_create_by(name: name)
  end

  def find_or_create_user(name)
    User.find_or_create_by(name: name)
  end

  def find_or_create_movie(data)
    Movie.find_or_create_by(
      name: data['Movie'],
      director: find_or_create_director(data['Director']),
      description: data['Description'],
      year: data['Year']
    )
  end

  def add_actor_filming_location_country(movie, actor, city, country)
    movie.actors << actor unless movie.actors.exists?(actor.id)
    movie.cities << city unless movie.cities.exists?(city.id)
    movie.countries << country unless movie.countries.exists?(country.id)
  end
end
