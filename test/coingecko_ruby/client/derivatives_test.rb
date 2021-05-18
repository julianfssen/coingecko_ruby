require 'test_helper'

class TestDerivatives < Minitest::Test
  def setup
    @client = CoingeckoRuby.client
    VCR.insert_cassette name
  end

  def test_that_it_gets_derivatives
    response = @client.get_derivatives
    refute_empty(response)
  end

  def test_that_it_gets_derivative_exchanges
    response = @client.get_derivative_exchanges
    refute_empty(response)
  end

  def test_that_it_gets_a_derivative_exchange
    response = @client.get_derivative_exchange(id: 'binance_futures')
    refute_empty(response)
  end

  def test_that_it_gets_derivatives_exchanges_ids_and_names
    response = @client.get_derivative_exchanges_ids_and_names
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
