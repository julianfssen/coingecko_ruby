require 'test_helper'

class TestFinance < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new
    VCR.insert_cassette name
  end

  def test_that_it_gets_finance_platforms
    response = @client.finance_platforms
    platform_data = response[0]
    assert_includes platform_data, 'name'
    assert_includes platform_data, 'category'
    assert_includes platform_data, 'website_url'
  end

  def test_that_it_gets_finance_products
    response = @client.finance_products
    product_data = response[0]
    assert_includes product_data, 'platform'
    assert_includes product_data, 'identifier'
    assert_includes product_data, 'supply_rate_percentage'
    assert_includes product_data, 'borrow_rate_percentage'
  end

  def teardown
    VCR.eject_cassette
  end
end
