require_relative './resource'
require_relative './market_data'

module CoingeckoRuby
  class Coin < Resource
    attr_reader :id, :market_data, :name, :symbol

    def initialize(raw_response)
      super
      @id = raw_response['id']
      @name = raw_response['name']
      @symbol = raw_response['symbol']
      @market_data = CoingeckoRuby::MarketData.new(raw_response['market_data'])
    end
  end
end
