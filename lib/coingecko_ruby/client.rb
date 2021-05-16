require 'coingecko_ruby/connection'
require 'coingecko_ruby/client/status'
require 'coingecko_ruby/client/prices'
require 'coingecko_ruby/client/coins'
require 'coingecko_ruby/client/categories'
require 'coingecko_ruby/client/exchanges'

module CoingeckoRuby
  class Client
    include CoingeckoRuby::Connection
    include CoingeckoRuby::Client::Status
    include CoingeckoRuby::Client::Prices
    include CoingeckoRuby::Client::Coins
    include CoingeckoRuby::Client::Categories
    include CoingeckoRuby::Client::Exchanges
  end
end
