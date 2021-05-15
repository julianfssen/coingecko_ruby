require "coingecko_ruby/version"
require "coingecko_ruby/client"

module CoingeckoRuby
  class << self
    def client
      CoingeckoRuby::Client.new
    end
  end
end
