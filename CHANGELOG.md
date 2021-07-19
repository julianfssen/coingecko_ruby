## 0.4.0 - 19-06-2021

### [Changed]

#### Modules
* Removed 'get' prefix and unnecessary keyword arguments from method calls to make usage more Ruby-like.

In previous versions, getting data from CoinGecko is invoked with a method like:

```ruby
  client.get_price(id: 'bitcoin')
```

Now, it's invoked in a more Ruby-like manner by excluding unnecessary keyword arguments and absorbing additional arguments via an `options` hash:

```ruby
  client.price('bitcoin', currency: 'usd', option_2: 'option', option_3: ...)
```

* Deprecated methods that were replaced by the change above. These deprecated methods can still be used but they will be removed in future versions.

#### Docs
* Updated docs to reflect method names and keyword arguments changes

#### Tests
* Updated tests to use the new methods.

## 0.3.0 - 18-05-2021

### [Added]

#### Modules
 * Added `Derivatives` module to fetch crypto derivatives data.
 * Added `Indexes` module to fetch crypto indexes data.
 * Added `Finance` module to fetch crypto finance data.
 * Added `Infos` module to fetch global crypto data.
 * Added `Events` module to fetch event data.

#### Tests
* Added basic unit tests for `Derivatives`, `Indexes`, `Finance`, `Infos`, and `Events` modules.

#### Docs
* Added `YARD` documentation (params, return values, usage, and response objects) for `Derivatives`, `Indexes`, `Finance`, `Infos`, and `Events` modules.

## 0.2.0 - 16-05-2021

### [Added]

#### Modules
 * Added `Exchanges` module to fetch exchange data.

#### Tests
 * Added `vcr` and `webmock` gems for testing.
 * Added basic unit tests for every client module.
 * Added setting for `vcr` episodes to use `:new_episodes` as the default `:record` mode.

#### Docs
 * Added `YARD` documentation (params, return values, usage, and response objects) for every method in client modules.

### [Changes]
 * Changed `get` method in `connection.rb` to build querystrings from the `options` object.
 * Changed method definitions to accept an `options` parameter to define options when making requests.

## 0.1.0 - 09-05-2021

 * Initial gem release!
