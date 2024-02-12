# README

How to Run

1. install docker
2. docker-compose build
3. docker-compose up
4. docker-compose exec web rails db:create
5. docker-compose exec web rails db:migrate
6. docker-compose exec web sidekiq -C config/sidekiq.yml
7. Open http://0.0.0.0:3000/ on the browser

I used services and job queues and sidekiq, redis and 

Associations:

Movie belongs to a Director.
Movie has many Reviews.
Review belongs to both Movie and User.
Movie has many Actors through MovieActor.
Movie has many Countries through MovieCountry.
Movie has many Cities through MovieCity.
MovieActor, MovieCountry, and MovieCity are join tables representing many-to-many relationships.
Review has a many-to-one relationship with both Movie and User.

