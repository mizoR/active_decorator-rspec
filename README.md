# ActiveDecorator::RSpec

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
