require "coingecko_ruby/version"
require "coingecko_ruby/client"

module CoingeckoRuby
  client = CoingeckoRuby::Client.new
  p client.status
end
