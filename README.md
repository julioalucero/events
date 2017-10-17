# Events

## Epic

You’ve been asked to build a web page that will be used to publish information about different events in Santa Fe (think meetup.com). Every event has a date, start & end time, place and list of pre-defined discussion topics.

## Stories
1. As a user, I can browse events.
2. As a user, I can filter events by:
  - city;
  - range of start date/times;
  - topic of interest.
3. As a user, I can save a search filter and re-use it in the future.
4. As a user, I get notified every time a new event is added that matches any of my saved filters. If I am browsing the site at the time, I would like an instant notification, otherwise, it should arrive by email.

## Setup
 * Ruby 2.4.0, rails 5.1.4
 * run `rake db:setup`

## Production environment
* https://jl-events.herokuapp.com/

## System Explanation

### Location:

At the moment I tried to keep it simple. I added all the cities of the state Santa Fe and put it in a constant. In fact the `Location` model only have the city attribute.

Anyway, there are different gems to add automatically all the cities. For example on a project in which I'm owner [www.haciendaenpie.com](http://www.haciendaenpie.com)
I did reverse locate given an latitude and longitude that the use select on google maps. [Some example code](https://gist.github.com/julioalucero/002ddc5494900f90c87affa4794b3967)

### Topics:
Given that the topics are already defined, I keep it in a constant.
The Events model have a serialize hash called topics.
Doing it we avoid to have has_many through association between the `Event` and a possible `Topic` class and the more complicated queries that it entails.

### Events:
- To manage the hours I decide to keep two attributes on the db as integers (`start_at`, `end_at`). I did in this way in an old project and it make the life easier in general (queries access)

## What is missing
These are items which are missing given that are outside of the purpose of this test but I prefer to mention them.

  - UI: Hamburger icon on collapse nav.
  - Add Rubocop.
  - Add CI.
  - The user create a Event.
  - Search:
      - Pagination of Events
      - Search using ajax
      - Sort values
      - clear search
      - search by one date instead of range or unless add some code on client to avoid search by one, use select on date search instead of string
      - idem upper but for time range.
  - Saved Search:
    - Edit, Destroy actions
  - Jobs:
    - Sidekiq authentication
  - Email:
    - Configure to send the email in production
  - Match Search:
    - In the same job I check given an event all the search. To make it scalable is necessary to do
      on query by saved search.
    - Currently I use only `after_create_commit`, but better would to add also `after_update_commit`
