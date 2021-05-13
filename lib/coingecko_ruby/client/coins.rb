module CoingeckoRuby
  class Client
    module Coins
      def coins_list
        get('coins/list')
      end

      def get_coin_data(id:)
        get("coins/#{id}")
      end

      def get_coin_tickers(id:)
        get("coins/#{id}")
      end

      def get_coin_data(id:)
        get("coins/#{id}")
      end

      def markets
        get('coins/markets')
      end
    end
  end
end
