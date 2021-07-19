require 'net/http'
require 'uri'
require 'json'

module CoingeckoRuby
  module Connection
    BASE_URL = 'https://api.coingecko.com/api/v3/'.freeze

    def get(endpoint, **params)
      url = BASE_URL + endpoint
      uri = URI(url)
      uri = build_request(uri, params) unless params.empty?
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    private

    def build_request(uri, params)
      uri.query = URI.encode_www_form(params)
      uri
    end
  end
end
