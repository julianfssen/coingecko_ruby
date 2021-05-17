require_relative 'lib/coingecko_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "coingecko_ruby"
  spec.version       = CoingeckoRuby::VERSION
  spec.authors       = ["Julian Foo Siang Sen"]
  spec.email         = ["juliandevmy@gmail.com"]

  spec.summary       = %q{An easy-to-use client/wrapper for CoinGecko's crypto API}
  spec.description   = %q{An easy-to-use client/wrapper for CoinGecko's crypto API. Get prices, exchanges, volume, and more without building your own API class.}
  spec.homepage      = "https://github.com/julianfssen/coingecko_ruby"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/julianfssen/coingecko_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/julianfssen/coingecko_ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # spec.files = %w(CHANGELOG.md LICENSE.md README.md Rakefile coingecko_ruby.gemspec)
  # spec.files += Dir.glob("lib/**/*.rb")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
