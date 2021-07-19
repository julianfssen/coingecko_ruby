![test suite](https://github.com/julianfssen/coingecko_ruby/actions/workflows/ruby.yml/badge.svg)

# CoingeckoRuby

CoingeckoRuby is an easy-to-use client/wrapper for CoinGecko's awesome cryptocurrency API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coingecko_ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install coingecko_ruby

## Usage

1. Require the gem if you're not using Rails or if your environment does not autoload libraries.

```ruby
require 'coingecko_ruby'
```

2. Create a client instance.

```ruby
client = CoingeckoRuby::Client.new
```

3. Use the client to fetch your desired data.

```ruby
# Example: Fetching the current price of Bitcoin.
client.price('bitcoin')
```

## Documentation

[Read the API documentation here: ](https://julianfssen.github.io/coingecko_ruby/CoingeckoRuby.html)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/julianfssen/coingecko_ruby.

## License

MIT License

Copyright (c) 2021 Julian Foo Siang Sen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
