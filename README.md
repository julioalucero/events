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

## Production environment
* https://jl-events.herokuapp.com/

## Considerations
1. UI
  - I added Bootstrap and setup a very basic UI in order to avoid that looks ugly.  will improve it if is necessary.

## What is missing
  These are items which are missing given that are outside of the purpose of this test:

  - UI: Hamburger icon on collapse nav.
  - Add Rubocop.
  - Add CI.
  - The user create a Event.
  - Search: Pagination of Events, do it using ajax, Sort values, clear search, search by one date instead of range, use select on date search instead of string


## Setup
 * Ruby 2.4.0, rails 5.1.4
 * run `rake db:setup`
