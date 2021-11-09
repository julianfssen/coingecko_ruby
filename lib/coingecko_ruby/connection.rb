require 'faraday'
require 'faraday_middleware'
require 'coingecko_ruby/error'
require_relative './resources/base'
require 'byebug'

module CoingeckoRuby
  module Connection
    BASE_URL = 'https://api.coingecko.com/api/v3/'.freeze

    def get(endpoint, **opts)
      request :get, endpoint, **opts
    end

    def request(method, endpoint, **opts)
      connection = create_connection
      response = connection.send(method, endpoint, opts)
      resource = opts[:resource]
      if raw_response || resource.nil?
        response.body
      else
        resource.new(response.body)
      end
    rescue Faraday::Error => e
      raise CoingeckoRuby::Error.delegate_and_return_error(e)
    end

    def create_connection
      connection = Faraday.new(url: BASE_URL) do |c|
        c.use Faraday::Response::RaiseError
        c.request :retry, max: 5
        c.response :json
      end
      connection
    end
  end
end
