require 'test_helper'

class TestDerivatives < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_derivatives
    response = @client.derivatives
    refute_empty(response)
  end

  def test_that_it_gets_derivative_exchanges
    response = @client.derivative_exchanges
    refute_empty(response)
  end

  def test_that_it_gets_a_derivative_exchange
    response = @client.derivative_exchange('binance_futures')
    refute_empty(response)
  end

  def test_that_it_gets_derivatives_exchanges_ids_and_names
    response = @client.derivative_exchanges_ids_and_names
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
