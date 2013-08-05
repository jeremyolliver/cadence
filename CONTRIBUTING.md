# Contributing to Cadence

Contributions to the Cadence project are welcome for both bug fixes, and new features. For any significant features, it's worth starting a discussion prior to beginning implementation.

Please use Github Pull Requests for submitting contributions:

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the [issue tracker](https://github.com/jeremyolliver/cadence/issues) to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please keep contributions to one feature/bug fix per pull request

## Development

Checkout the source code

    git clone git@github.com:jeremyolliver/cadence.git

Install dependencies and setup project

    bundle install
    bundle exec rake db:setup

Run server

    bundle exec rails server

Run tests

    bundle exec rake spec
