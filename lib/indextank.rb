require 'faraday'
require 'faraday_middleware'

require 'indextank/client'

module IndexTank
  def self.setup_connection(url)
    Faraday::Connection.new(:url => url) do |builder|
      builder.adapter Faraday.default_adapter
      builder.use Faraday::Response::MultiJson
      builder.use Faraday::Response::Mashify
    end
  end
end