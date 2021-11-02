require 'faraday'
require 'faraday_middleware'
require 'coingecko_ruby/error'

module CoingeckoRuby
  module Connection
    BASE_URL = 'https://api.coingecko.com/api/v3/'.freeze

    def get(endpoint, **params)
      connection = Faraday.new(url: BASE_URL) do |c|
        c.use Faraday::Response::RaiseError
        c.request :retry, max: 5
        c.response :json
      end
      response = connection.get(endpoint, params)
      handle_response(response)
    end

    def handle_response(response)
      response.body
    rescue Faraday::Error => e
      wrapped_error_class = CoingeckoRuby::Error.wrap_error(e)
      raise wrapped_error_class.new(e.message, response)
    end
  end
end
