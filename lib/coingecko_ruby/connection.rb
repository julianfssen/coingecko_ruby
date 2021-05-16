require 'net/http'
require 'uri'
require 'json'

module CoingeckoRuby
  module Connection
    BASE_URL = 'https://api.coingecko.com/api/v3/'

    def get(endpoint, options = {})
      url = BASE_URL + endpoint
      uri = URI(url)
      uri = build_query(uri, options) unless options.empty?
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    private

    def build_query(uri, query)
      if query[:options]
        options = query.delete(:options)
        query = query.merge(options)
      end
      uri.query = URI.encode_www_form(query)
      uri
    end
  end
end
