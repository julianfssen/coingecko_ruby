require 'net/http'
require 'uri'
require 'json'

module CoingeckoRuby
  module Connection
    BASE_URL = 'https://api.coingecko.com/api/v3/'

    def get(endpoint, options = {})
      url = BASE_URL + endpoint
      uri = URI(url)
      if options[:query]
        uri = build_params(uri, options[:query])
      end
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    private

    def build_params(uri, params)
      uri.query = URI.encode_www_form(params)
      uri
    end
  end
end
