# ActiveDecorator::RSpec

[![Build Status](https://img.shields.io/travis/mizoR/active_decorator-rspec/master.svg?style=flat)](https://travis-ci.org/mizoR/active_decorator-rspec)
[![Code Climate](https://img.shields.io/codeclimate/github/mizoR/active_decorator-rspec/badges/gpa.svg?style=flat)](https://codeclimate.com/github/mizoR/active_decorator-rspec)
[![Dependency Status](https://img.shields.io/gemnasium/mizoR/active_decorator-rspec.svg?style=flat)](https://gemnasium.com/mizoR/active_decorator-rspec)


## Installation

Add this line to your application's Gemfile:

    gem 'active_decorator-rspec'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_decorator-rspec

## Usage

First you need to require active_decorator/rspec in your spec_helper.rb:

```
require "active_decorator/rspec"
```

And You will need to include ActiveDecorator::RSpec in your example groups:

```
config.include ActiveDecorator::RSpec, type: :decorator
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/active_decorator-rspec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
