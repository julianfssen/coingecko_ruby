require_relative './resource'

module CoingeckoRuby
  class MarketData < Resource
    attr_reader :ath, :atl, :current_price, :market_cap, :roi, :total_supply, :total_volume

    def initialize(data)
      super
      @ath = data['ath']
      @atl = data['atl']
      @current_price = data['current_price']
      @market_cap = data['market_cap']
      @roi = data['roi']
      @total_supply = data['total_supply']
      @total_volume = data['total_volume']
    end
  end
end
