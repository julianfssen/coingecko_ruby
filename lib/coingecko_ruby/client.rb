require 'coingecko_ruby/connection'
require 'coingecko_ruby/client/status'
require 'coingecko_ruby/client/prices'
require 'coingecko_ruby/client/coins'
require 'coingecko_ruby/client/categories'
require 'coingecko_ruby/client/exchanges'
require 'coingecko_ruby/client/indexes'
require 'coingecko_ruby/client/finance'
require 'coingecko_ruby/client/derivatives'
require 'coingecko_ruby/client/events'
require 'coingecko_ruby/client/infos'

module CoingeckoRuby
  class Client
    include CoingeckoRuby::Connection
    include CoingeckoRuby::Client::Status
    include CoingeckoRuby::Client::Prices
    include CoingeckoRuby::Client::Coins
    include CoingeckoRuby::Client::Categories
    include CoingeckoRuby::Client::Exchanges
    include CoingeckoRuby::Client::Indexes
    include CoingeckoRuby::Client::Finance
    include CoingeckoRuby::Client::Derivatives
    include CoingeckoRuby::Client::Events
    include CoingeckoRuby::Client::Infos
  end
end
