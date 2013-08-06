# Cadence

[![Build Status](https://travis-ci.org/jeremyolliver/cadence.png?branch=master)](https://travis-ci.org/jeremyolliver/cadence)
[![Coverage Status](https://coveralls.io/repos/jeremyolliver/cadence/badge.png?branch=master)](https://coveralls.io/r/jeremyolliver/cadence?branch=master)
[![Code Climate](https://codeclimate.com/github/jeremyolliver/cadence.png)](https://codeclimate.com/github/jeremyolliver/cadence)
[![Dependency Status](https://gemnasium.com/jeremyolliver/cadence.png)](https://gemnasium.com/jeremyolliver/cadence)

Cadence is an application aimed at keeping track of the healthiness of your application/project. It recieves and aggregates reports ranging from code coverage, style guide adherence, and security report results.

At present it is a work in progress, keep an eye on https://github.com/jeremyolliver/cadence/releases for updates that will be made available when stable releases are done.

## Feature list/Wishlist:

* [ ] Support for organisations with multiple users and projects
* [ ] Support for code coverage via simplecov
* [ ] Display history of submitted coverage
* [ ] Browse through to full coverage reports from list
* [ ] Display graph of change in coverage over time
* [ ] Support for style guide (e.g. cane results)
* [ ] Support for brakeman security reports
* [ ] Support for private organisations/projects and user ACL's

## Installation

Ruby 2.0 and Ruby 1.9.3 will be officially supported and tested on. To install the application:

Checkout the source code, and install the dependencies:

    git clone git@github.com:jeremyolliver/cadence.git
    bundle install --deployment --without development test
    bundle exec rails server

## Contributing to Cadence

Please read the [contribution guidelines](https://github.com/jeremyolliver/cadence/blob/master/CONTRIBUTING.md)

- - -

Copyright 2013 Jeremy Olliver