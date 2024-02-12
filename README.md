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

1. Movie belongs to a Director.
2. Movie has many Reviews.
3. Review belongs to both Movie and User.
4. Movie has many Actors through MovieActor.
5. Movie has many Countries through MovieCountry.
6. Movie has many Cities through MovieCity.
7. MovieActor, MovieCountry, and MovieCity are join tables representing many-to-many relationships.
8. Review has a many-to-one relationship with both Movie and User.

