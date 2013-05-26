# What Up Twitter

## Goal

A simple Twitter search application.  Search for terms or
profiles.  Results are cached for 5 minutes in order to prevent
API throttling problems.


## Technical Details

### System Dependencies

* Ruby 1.9.3
* Bundler
* PostgreSQL
* Memcached (non-prod)
* Memcashier (Heroku)

### Environment Setup

**ENV**: Authentication vars for Twitter are exported to environment variables:

* `TWITTER_CONSUMER_KEY`
* `TWITTER_CONSUMER_SECRET`
