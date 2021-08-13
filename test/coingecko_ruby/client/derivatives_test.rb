require 'test_helper'

class TestDerivatives < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_derivatives
    response = @client.derivatives
    derivative_data = response[0]
    assert_includes derivative_data, 'market'
    assert_includes derivative_data, 'symbol'
    assert_includes derivative_data, 'index_id'
    assert_includes derivative_data, 'price'
    assert_includes derivative_data, 'price_percentage_change_24h'
    assert_includes derivative_data, 'volume_24h'
    assert_includes derivative_data, 'expired_at'
  end

  def test_that_it_gets_derivative_exchanges
    response = @client.derivative_exchanges
    exchange_data = response[0]
    assert_includes exchange_data, 'name'
    assert_includes exchange_data, 'id'
    assert_includes exchange_data, 'open_interest_btc'
    assert_includes exchange_data, 'trade_volume_24h_btc'
    assert_includes exchange_data, 'url'
  end

  def test_that_it_gets_a_derivative_exchange
    response = @client.derivative_exchange('binance_futures')
    assert_includes response, 'name'
    assert_includes response, 'open_interest_btc'
    assert_includes response, 'trade_volume_24h_btc'
    assert_includes response, 'url'
  end

  def test_that_it_gets_derivatives_exchanges_ids_and_names
    response = @client.derivative_exchanges_ids_and_names
    exchange_data = response[0]
    assert_includes exchange_data, 'id'
    assert_includes exchange_data, 'name'
  end

  def teardown
    VCR.eject_cassette
  end
end
