require 'net/http'

module CoingeckoRuby
  class Client
    def status
      Net::HTTP.get('https://coingecko.com/api/ping')
    end
  end
end
