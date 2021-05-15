require "test_helper"

class CoingeckoRubyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CoingeckoRuby::VERSION
  end

  def test_that_it_returns_a_new_client_instance
    assert_instance_of CoingeckoRuby::Client, CoingeckoRuby.client
  end
end
