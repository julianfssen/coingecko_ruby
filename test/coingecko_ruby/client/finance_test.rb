require 'test_helper'

class TestFinance < Minitest::Test
  def setup
    @client = CoingeckoRuby.client
    VCR.insert_cassette name
  end

  def test_that_it_gets_finance_platforms
    response = @client.get_finance_platforms
    refute_empty(response)
  end

  def test_that_it_gets_finance_products
    response = @client.get_finance_products
    refute_empty(response)
  end

  def teardown
    VCR.eject_cassette
  end
end
