# Avgbm

Adds `avgbm` method to Ruby `Benchmark` std lib, that discards highest/lowest times and averages the remaining results.

[![Gem Version](https://badge.fury.io/rb/avgbm.svg)](http://badge.fury.io/rb/avgbm)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'avgbm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install avgbm

## Usage

The first param is number of times to run each code block (defaults to and minimum is 5).

Second param is the label width for printing.

The method discards about 20% highest/lowest times and averages the remaining 60% results.

```ruby
Benchmark.avgbm(10) do |x|
  x.report("pluck")  { Node.pluck(:id, :title)  }
  x.report("select") { Node.select(:id, :title).to_a }
  x.report("as_json") { Node.select(:id, :title).as_json }
end

# =>
#                user     system      total        real
# pluck      0.183333   0.011667   0.195000 (  0.217569)
# select     0.701667   0.023333   0.725000 (  0.766307)
# as_json    1.623333   0.041667   1.665000 (  1.751188)

```


## Contributing

1. Fork it ( https://github.com/girishso/avgbm/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
