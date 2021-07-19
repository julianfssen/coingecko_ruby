module CoingeckoRuby
  class Client
    module Infos
      # Fetches global crypto data from CoinGecko.
      #
      # @return [Hash] global crypto data (e.g. market cap, total volume, active ICOs, etc.)
      #
      # @example Get global crypto data.
      #   client.global_crypto_data
      # @example Sample response object (truncated)
      #   {
      #     "data" => {
      #       "active_cryptocurrencies" => 7361,
      #       "upcoming_icos" => 0,
      #       "ongoing_icos" => 50,
      #       "ended_icos" => 3375,
      #       "markets" => 616,
      #       "total_market_cap" => {
      #         "btc" => 48541739.601360835,
      #         "eth" => 628896708.615425,
      #         "ltc" => 7052042789.61238,
      #         "bch" => 1934433566.5425043
      #       },
      #       "total_volume" => {
      #         "btc" => 6568919.505737251,
      #         "eth" => 85105558.43783577,
      #         "ltc" => 954318939.049309,
      #         "usd" => 286508058915.08606
      #       }
      #       "market_cap_percentage" => {
      #         "btc" => 38.55040456662042,
      #         "eth" => 18.387297257364622,
      #       },
      #       "market_cap_change_percentage_24h_usd" => -3.133283965790086,
      #       "updated_at" => 1621344957
      #     }
      #   }
      def global_crypto_data
        get 'global'
      end

      # @deprecated Use {#global_crypto_data} instead
      def get_global_crypto_data
        global_crypto_data
      end

      # Fetches global crypto data from CoinGecko.
      #
      # @return [Hash] global defi data.
      #
      # @example Get global defi data.
      #   client.global_defi_data
      # @example Sample response object
      #   {
      #     "data" => {
      #       "defi_market_cap" => "125745676087.2760332093360054945",
      #       "eth_market_cap" => "394420680555.8088822113739591981",
      #       "defi_to_eth_ratio" =>
      #       "31.8811062112863892278072770612100063079659263284319798945238447",
      #       "trading_volume_24h" => "15011166214.23270941006219308344",
      #       "defi_dominance" =>
      #       "5.8997291574682455351428477202615510371051549446051010984545824",
      #       "top_coin_name" => "Uniswap",
      #       "top_coin_defi_dominance" => 14.449398175884316
      #     }
      #   }
      def global_defi_data
        get 'global/decentralized_finance_defi'
      end

      # @deprecated Use {#global_defi_data} instead
      def get_global_defi_data
        global_defi_data
      end

      # Fetches the top 7 coin searches from CoinGecko in the last 24 hours.
      #
      # @return [Hash] the ternding searches and its information.
      #
      # @example Get trending searches in the last 24 hours.
      #   client.trending_searches
      # @example Sample response object (truncated)
      #   {
      #     "coins" => [{
      #         "item" => {
      #           "id" => "shiba-inu",
      #           "coin_id" => 11939,
      #           "name" => "Shiba Inu",
      #           "symbol" => "SHIB",
      #           "market_cap_rank" => 24,
      #           "thumb" =>
      #           "https://assets.coingecko.com/coins/images/11939/thumb/SHIBLOGO.png?1600752116",
      #           "small" =>
      #           "https://assets.coingecko.com/coins/images/11939/small/SHIBLOGO.png?1600752116",
      #           "large" =>
      #           "https://assets.coingecko.com/coins/images/11939/large/SHIBLOGO.png?1600752116",
      #           "slug" => "shiba-inu",
      #           "price_btc" => 3.637711629799728e-10,
      #           "score" => 0
      #         }
      #       },
      #     ],
      #     "exchanges" => []
      #   }
      def trending_searches
        get 'search/trending'
      end

      # @deprecated Use {#trending_searches} instead
      def get_trending_searches
        trending_searches
      end

      # Fetches coin and/or market status updates.
      #
      # @option options [String] :category filter results by the given category. Valid values: general, milestone, partnership, exchange_listing, software_release, fund_movement, new_listings, event
      # @option options [String] :project_type filter results by the project type. Fetches both coin and market status updates if left blank. Valid values: coin, market
      # @option options [Integer] :per_page sets the number of results to return per page.
      # @option options [Integer] :page sets the page for results.
      #
      # @return [Hash] the list of status updates and its information.
      #
      # @example Get a single status update.
      #   client.status_updates(per_page: 1)
      # @example Sample response object
      #   {
      #     "status_updates" => [{
      #       "description" =>
      #       "📢 Community Call & AMA Invitation 📢\r\n" +
      #       "\r\n" +
      #       "Thursday 20th May at 4pm CET (Registration below)\r\n" +
      #       "\r\n" +
      #       "During this event, we will be updating our community on the latest news and developments at Fuse, covering:\r\n" +
      #       "\r\n" +
      #       "- Fuse Dollar (fUSD)\r\n" +
      #       "- Fuse Cash\r\n" +
      #       "- Latest partnerships and integrations.\r\n" +
      #       "- Binance Smart Chain (BSC) bridge.\r\n" +
      #       "- DeFi on Fuse.\r\n" +
      #       "- Featured communities.\r\n" +
      #       "- What to expect for the rest of Q2 and beyond!\r\n" +
      #       "\r\n" +
      #       "Please register 👉 https://bit.ly/3furWZs",
      #       "category" => "general",
      #       "created_at" => "2021-05-18T08:29:06.537Z",
      #       "user" => "Robert Miller",
      #       "user_title" => "Marcom Director ",
      #       "pin" => false,
      #       "project" => {
      #         "type" => "Coin",
      #         "id" => "fuse-network-token",
      #         "name" => "Fuse",
      #         "symbol" => "fuse",
      #         "image" => {
      #           "thumb" =>
      #           "https://assets.coingecko.com/coins/images/10347/thumb/vUXKHEe.png?1601523640",
      #           "small" =>
      #           "https://assets.coingecko.com/coins/images/10347/small/vUXKHEe.png?1601523640",
      #           "large" =>
      #           "https://assets.coingecko.com/coins/images/10347/large/vUXKHEe.png?1601523640"
      #         }
      #       }
      #     }]
      #   }
      def status_updates(**options)
        get 'status_updates', options
      end

      def get_status_updates(options: {})
        status_updates(**options)
      end
    end
  end
end
