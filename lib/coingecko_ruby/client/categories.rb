module CoingeckoRuby
  class Client
    module Categories
      # Fetches the list of coin categories in CoinGecko.
      #
      # @return [Array<Hash>] each category's id and name
      #
      # @example Get all coin categories.
      #   client.get_categories
      # @example Response object
      #   [{
      #     "category_id" => "recently_added",
      #     "name" => "Recently Added"
      #   }, {
      #     "category_id" => "aave-tokens",
      #     "name" => "Aave Tokens"
      #   }, {
      #     "category_id" => "analytics",
      #     "name" => "Analytics"
      #   }, {
      #     "category_id" => "artificial-intelligence",
      #     "name" => "Artificial Intelligence"
      #   }, {
      #     "category_id" => "asset-backed-tokens",
      #     "name" => "Asset-backed Tokens"
      #   }, {
      #     "category_id" => "asset-manager",
      #     "name" => "Asset Manager"
      #   }, {
      #     "category_id" => "augmented-reality",
      #     "name" => "Augmented Reality"
      #   }, {
      #     "category_id" => "automated-market-maker-amm",
      #     "name" => "Automated Market Maker (AMM)"
      #   }, {
      #     "category_id" => "avalanche-ecosystem",
      #     "name" => "Avalanche Ecosystem"
      #   }, {
      #     "category_id" => "axie-infinity",
      #     "name" => "Axie Infinity"
      #   }, {
      #     "category_id" => "big-data",
      #     "name" => "Big Data"
      #   }, {
      #     "category_id" => "binance-launchpool",
      #     "name" => "Binance Launchpool"
      #   }, {
      #     "category_id" => "binance-smart-chain",
      #     "name" => "Binance Smart Chain Ecosystem"
      #   }, {
      #     "category_id" => "business-platform",
      #     "name" => "Business Platform"
      #   }, {
      #     "category_id" => "business-services",
      #     "name" => "Business Services"
      #   }, {
      #     "category_id" => "centralized-exchange-token-cex",
      #     "name" => "Centralized Exchange Token (CEX)"
      #   }, {
      #     "category_id" => "charity",
      #     "name" => "Charity"
      #   }, {
      #     "category_id" => "cny-stablecoin",
      #     "name" => "CNY Stablecoin"
      #   }, {
      #     "category_id" => "collectibles",
      #     "name" => "Collectibles"
      #   }, {
      #     "category_id" => "communication",
      #     "name" => "Communication"
      #   }, {
      #     "category_id" => "compound-tokens",
      #     "name" => "Compound Tokens"
      #   }, {
      #     "category_id" => "cosmos-ecosystem",
      #     "name" => "Cosmos Ecosystem"
      #   }, {
      #     "category_id" => "cryptocurrency",
      #     "name" => "Cryptocurrency"
      #   }, {
      #     "category_id" => "decentralized-exchange",
      #     "name" => "Decentralized Exchange Token (DEX)"
      #   }, {
      #     "category_id" => "decentralized-finance-defi",
      #     "name" => "Decentralized Finance (DeFi)"
      #   }, {
      #     "category_id" => "defi-index",
      #     "name" => "DeFi Index"
      #   }, {
      #     "category_id" => "decentralized-derivatives",
      #     "name" => "Derivatives"
      #   }, {
      #     "category_id" => "education",
      #     "name" => "Education"
      #   }, {
      #     "category_id" => "energy",
      #     "name" => "Energy"
      #   }, {
      #     "category_id" => "entertainment",
      #     "name" => "Entertainment"
      #   }, {
      #     "category_id" => "etf",
      #     "name" => "ETF"
      #   }, {
      #     "category_id" => "eth-2-0-staking",
      #     "name" => "Eth 2.0 Staking"
      #   }, {
      #     "category_id" => "eur-stablecoin",
      #     "name" => "EUR Stablecoin"
      #   }, {
      #     "category_id" => "exchange-based-tokens",
      #     "name" => "Exchange-based Tokens"
      #   }, {
      #     "category_id" => "fan-token",
      #     "name" => "Fan Token"
      #   }, {
      #     "category_id" => "finance-banking",
      #     "name" => "Finance / Banking"
      #   }, {
      #     "category_id" => "gambling",
      #     "name" => "Gambling"
      #   }, {
      #     "category_id" => "gaming",
      #     "name" => "Gaming"
      #   }, {
      #     "category_id" => "gbp-stablecoin",
      #     "name" => "GBP Stablecoin"
      #   }, {
      #     "category_id" => "gig-economy",
      #     "name" => "Gig Economy"
      #   }, {
      #     "category_id" => "governance",
      #     "name" => "Governance"
      #   }, {
      #     "category_id" => "healthcare",
      #     "name" => "Healthcare"
      #   }, {
      #     "category_id" => "heco-chain-ecosystem",
      #     "name" => "HECO Chain Ecosystem"
      #   }, {
      #     "category_id" => "index-coin",
      #     "name" => "Index"
      #   }, {
      #     "category_id" => "infrastructure",
      #     "name" => "Infrastructure"
      #   }, {
      #     "category_id" => "insurance",
      #     "name" => "Insurance"
      #   }, {
      #     "category_id" => "internet-of-things-iot",
      #     "name" => "Internet of Things (IOT)"
      #   }, {
      #     "category_id" => "investment",
      #     "name" => "Investment"
      #   }, {
      #     "category_id" => "krw-stablecoin",
      #     "name" => "KRW Stablecoin"
      #   }, {
      #     "category_id" => "launchpad",
      #     "name" => "Launchpad"
      #   }, {
      #     "category_id" => "layer-1",
      #     "name" => "Layer 1"
      #   }, {
      #     "category_id" => "legal",
      #     "name" => "Legal"
      #   }, {
      #     "category_id" => "lending-borrowing",
      #     "name" => "Lending/Borrowing"
      #   }, {
      #     "category_id" => "lp-tokens",
      #     "name" => "LP Tokens"
      #   }, {
      #     "category_id" => "manufacturing",
      #     "name" => "Manufacturing"
      #   }, {
      #     "category_id" => "marketing",
      #     "name" => "Marketing"
      #   }, {
      #     "category_id" => "masternodes",
      #     "name" => "Masternodes"
      #   }, {
      #     "category_id" => "media",
      #     "name" => "Media"
      #   }, {
      #     "category_id" => "meme-token",
      #     "name" => "Meme Tokens"
      #   }, {
      #     "category_id" => "metaverse",
      #     "name" => "Metaverse"
      #   }, {
      #     "category_id" => "mirrored-assets",
      #     "name" => "Mirrored Assets"
      #   }, {
      #     "category_id" => "music",
      #     "name" => "Music"
      #   }, {
      #     "category_id" => "near-protocol-ecosystem",
      #     "name" => "Near Protocol Ecosystem"
      #   }, {
      #     "category_id" => "nft-index",
      #     "name" => "NFT Index"
      #   }, {
      #     "category_id" => "niftex-shards",
      #     "name" => "Niftex Shards"
      #   }, {
      #     "category_id" => "non-fungible-tokens-nft",
      #     "name" => "Non-Fungible Tokens (NFT)"
      #   }, {
      #     "category_id" => "number",
      #     "name" => "Number"
      #   }, {
      #     "category_id" => "decentralized-options",
      #     "name" => "Options"
      #   }, {
      #     "category_id" => "oracle",
      #     "name" => "Oracle"
      #   }, {
      #     "category_id" => "other",
      #     "name" => "Other"
      #   }, {
      #     "category_id" => "decentralized-perpetuals",
      #     "name" => "Perpetuals"
      #   }, {
      #     "category_id" => "dot-ecosystem",
      #     "name" => "Polkadot Ecosystem"
      #   }, {
      #     "category_id" => "polygon-ecosystem",
      #     "name" => "Polygon Ecosystem"
      #   }, {
      #     "category_id" => "prediction-markets",
      #     "name" => "Prediction Markets"
      #   }, {
      #     "category_id" => "privacy-coins",
      #     "name" => "Privacy Coins"
      #   }, {
      #     "category_id" => "protocol",
      #     "name" => "Protocol"
      #   }, {
      #     "category_id" => "real-estate",
      #     "name" => "Real Estate"
      #   }, {
      #     "category_id" => "rebase-tokens",
      #     "name" => "Rebase Tokens"
      #   }, {
      #     "category_id" => "reddit-points",
      #     "name" => "Reddit Points"
      #   }, {
      #     "category_id" => "remittance",
      #     "name" => "Remittance"
      #   }, {
      #     "category_id" => "retail",
      #     "name" => "Retail"
      #   }, {
      #     "category_id" => "seigniorage",
      #     "name" => "Seigniorage"
      #   }, {
      #     "category_id" => "smart-contract-platform",
      #     "name" => "Smart Contract Platform"
      #   }, {
      #     "category_id" => "social-money",
      #     "name" => "Social Money"
      #   }, {
      #     "category_id" => "software",
      #     "name" => "Software"
      #   }, {
      #     "category_id" => "solana-ecosystem",
      #     "name" => "Solana Ecosystem"
      #   }, {
      #     "category_id" => "sports",
      #     "name" => "Sports"
      #   }, {
      #     "category_id" => "stablecoins",
      #     "name" => "Stablecoins"
      #   }, {
      #     "category_id" => "storage",
      #     "name" => "Storage"
      #   }, {
      #     "category_id" => "synthetic-assets",
      #     "name" => "Synthetic Issuer"
      #   }, {
      #     "category_id" => "synths",
      #     "name" => "Synths"
      #   }, {
      #     "category_id" => "technology-science",
      #     "name" => "Technology & Science"
      #   }, {
      #     "category_id" => "terra-ecosystem",
      #     "name" => "Terra Ecosystem"
      #   }, {
      #     "category_id" => "tokenized-btc",
      #     "name" => "Tokenized BTC"
      #   }, {
      #     "category_id" => "tokenized-gold",
      #     "name" => "Tokenized Gold"
      #   }, {
      #     "category_id" => "tokenized-products",
      #     "name" => "Tokenized Products"
      #   }, {
      #     "category_id" => "tokensets",
      #     "name" => "TokenSets"
      #   }, {
      #     "category_id" => "tourism",
      #     "name" => "Tourism"
      #   }, {
      #     "category_id" => "usd-stablecoin",
      #     "name" => "USD Stablecoin"
      #   }, {
      #     "category_id" => "us-election-2020",
      #     "name" => "US Election 2020"
      #   }, {
      #     "category_id" => "utokens",
      #     "name" => "uTokens"
      #   }, {
      #     "category_id" => "virtual-reality",
      #     "name" => "Virtual Reality"
      #   }, {
      #     "category_id" => "wallets",
      #     "name" => "Wallets"
      #   }, {
      #     "category_id" => "wrapped-tokens",
      #     "name" => "Wrapped-Tokens"
      #   }, {
      #     "category_id" => "yearn-yfi-partnerships-mergers",
      #     "name" => "Yearn Ecosystem"
      #   }, {
      #     "category_id" => "yield-aggregator",
      #     "name" => "Yield Aggregator"
      #   }, {
      #     "category_id" => "yield-farming",
      #     "name" => "Yield Farming"
      #   }]
      def get_categories
        get('coins/categories/list')
      end

      # Fetches the list of coin categories with its respective market data.
      #
      # @return [Array<Hash>] each category's id, name, and market data
      #
      # @example Get all coin categories with market data.
      #   client.get_categories_with_market_data
      # @example Response object
      #   [{
      #       "id" => "exchange-based-tokens",
      #       "name" => "Exchange-based Tokens",
      #       "market_cap" => 169371736001.31586,
      #       "market_cap_change_24h" => -0.0922414270544203,
      #       "volume_24h" => 15951052818.441586,
      #       "updated_at" => "2021-05-16T08:20:23.151Z"
      #     },
      #     {
      #       "id" => "decentralized-finance-defi",
      #       "name" => "Decentralized Finance (DeFi)",
      #       "market_cap" => 136820578041.49733,
      #       "market_cap_change_24h" => -0.9466181422841903,
      #       "volume_24h" => 14287923081.250826,
      #       "updated_at" => "2021-05-16T08:20:20.877Z"
      #     },
      #     {
      #       "id" => "centralized-exchange-token-cex",
      #       "name" => "Centralized Exchange Token (CEX)",
      #       "market_cap" => 122947523197.55856,
      #       "market_cap_change_24h" => 0.26640274656563356,
      #       "volume_24h" => 11040737416.224226,
      #       "updated_at" => "2021-05-16T08:20:06.231Z"
      #     },
      #     {
      #       "id" => "binance-smart-chain",
      #       "name" => "Binance Smart Chain Ecosystem",
      #       "market_cap" => 116361546228.1391,
      #       "market_cap_change_24h" => 0.4826745508659215,
      #       "volume_24h" => 16613002144.076551,
      #       "updated_at" => "2021-05-16T08:20:18.419Z"
      #     },
      #     {
      #       "id" => "stablecoins",
      #       "name" => "Stablecoins",
      #       "market_cap" => 97325984356.89694,
      #       "market_cap_change_24h" => -0.0875726509433792,
      #       "volume_24h" => 200476835791.99164,
      #       "updated_at" => "2021-05-16T08:20:24.440Z"
      #     },
      #     {
      #       "id" => "dot-ecosystem",
      #       "name" => "Polkadot Ecosystem",
      #       "market_cap" => 80036030929.50584,
      #       "market_cap_change_24h" => -2.095750731441014,
      #       "volume_24h" => 9976746509.269482,
      #       "updated_at" => "2021-05-16T08:20:20.395Z"
      #     },
      #     {
      #       "id" => "governance",
      #       "name" => "Governance",
      #       "market_cap" => 61646638642.600464,
      #       "market_cap_change_24h" => -1.6030575560698792,
      #       "volume_24h" => 7027881997.164181,
      #       "updated_at" => "2021-05-16T08:20:22.367Z"
      #     },
      #   ]
      def get_categories_with_market_data
        get('coins/categories')
      end
    end
  end
end
