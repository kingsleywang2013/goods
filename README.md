# README

This is a code challenge

### Configuration
* Needs install `docker` and `docker-compose` in your machine

### How to run app
* Clone repo in your local
* run command `docker-compose up`

### How to run the test suite
* `docker-compose run --rm app bash`
* `bundle exec rspec spec`

### Test Data
* There is a csv file called `data` could be used as test for importing

### Improvements
* Could add gem `kaminari` to enable pagination
* Could add gem `sidekiq` and database `redis` to enable import job to run at backend job
* Could use any Frontend framework like Vue/React to make listing goods as a component
* Could seperate import process into two steps. First step is validator and gave the validate report. Second step is dose import
* Could use `Ajax` to enable filter instead of reloading page
