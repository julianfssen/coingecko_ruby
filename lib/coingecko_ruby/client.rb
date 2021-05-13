require 'coingecko_ruby/connection'
require 'coingecko_ruby/client/status'
require 'coingecko_ruby/client/prices'
require 'coingecko_ruby/client/coins'

module CoingeckoRuby
  class Client
    include CoingeckoRuby::Connection
    include CoingeckoRuby::Client::Status
    include CoingeckoRuby::Client::Prices
    include CoingeckoRuby::Client::Coins
  end
end
