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
filtering of your active record models.  To use filter params, ApiMonkey
expects the parameters send to rails to resolve like this:

```ruby
# http://my.domain/products?filter[price]=200

{
  filter: {
    price: 200
  }
}
```
This would filter our Product query to only those with `price = 200`

More complex filters can be applied using an operator shorthand that
allows for equality and comparison operators.  The list of possible
operators are:

|SQL Operator|Operator Shorthand|
|---|---|
|=|eq|
|>|gt|
|<|lt|
|<=|leq|
|>=|geq|

To use these, just change the concrete value for `price` in the above
hash to it's own hash using the operators as keys:

```ruby
# http://my.domain/products?filter[price[gt]]=200

{
  filter: {
    price: {
      'gt' => 200
    }
  }
}
```

Or:

```ruby
# http://my.domain/products?filter[price[gt]]=200&filter[price[leq]]=350

{
  filter: {
    price: {
      'gt' => 200,
      'leq' => 350
    }
  }
}
```

To use ApiMonkey in an exisitng Rails app, you have to include the ApiMonkey module in your model like this:

```ruby
class Product < ActiveRecord::Base
  include ApiMonkey
end
```

This will create all the necessary filtering methods that will be used
in your controller.  Next we want to add the filter to our controller. Use a methodology similar to
strong parameters.  We recommend using a controller method like this:

```ruby
# app/controllers/products_controller.rb

class ProductsController < ApplicationController
  def index
    @products = if params[:filter]
                  Product.filter(filter_params)
                else
                  Product.all
  end

  protected

  def filter_params
    params.require(:filter).permit(Product.filter_params)
  end
end
```

`Model.filter_params` is a simple hash so it supports methods like
`include` and `except` to help control the fields that can be filtered
against.
`filter` is designed so that passing either `nil` or `{}` to it will
produce an empty set (`where(nil)`). Therefore, you should ensure that
filter exists as a key in `params`. Passing `nil` to one of the
`filter_xxx` will result in a `where(xxx: nil)`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaelkelly322/api_resource. Guidelines and suggestion can be found in our [CONTRIBUTE.md file](https://github.com/michaelkelly322/api_monkey/blob/master/CONTRIBUTE.md). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

