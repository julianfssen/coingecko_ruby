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
