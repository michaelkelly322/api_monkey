# ApiMonkey
Makes building data-driven APIs in Rails a breeze by providing an easy to use DSL for declaring API resources.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'api_monkey'
```

And then execute:

    $ bundle

## Usage
Once you have ApiMonkey installed, declare your model as an ApiMonkey model:

```ruby
# app/models/product.rb

class Product < ActiveRecord::Base
  include ApiMonkey
end
```

### Filter Params
Filter params provide a clean and easy way to add request-based
filtering of your active record models:

```ruby
# app/controllers/products_controller.rb

class ProductsController < ApplicationController
  def index
    @products = Product.filter(filter_params)
  end

  protected

  def filter_params
    params.slice(:active, :price, :code)
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaelkelly322/api_resource. Guidelines and suggestion can be found in our [CONTRIBUTE.md file](https://github.com/michaelkelly322/api_monkey/blob/master/CONTRIBUTE.md). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

