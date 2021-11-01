require 'test_helper'

class TestError < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    ClientErrorStatuses = (400...451).freeze
    ServerErrorStatuses = (500...511).freeze
  end

  def test_that_it_rescues_exceptions_from_faraday_and_wraps_it_correctly
    ClientErrorStatuses.each do |code|
    end
  end
end
