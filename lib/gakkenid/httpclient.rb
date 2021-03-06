require 'json'
require 'net/http'
require 'uri'

module Gakkenid
  class HTTPClient
    # @return [Hash]
    attr_accessor :http_options

    # Initialize a new HTTPClient
    #
    # @param http_options [Hash]
    #
    # @return [Line::Bot::HTTPClient]
    def initialize(http_options = {})
      @http_options = http_options
    end

    # @return [Net::HTTP]
    def http(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == "https"
        http.use_ssl = true
      end

      http_options&.each do |key, value|
        http.send("#{key}=", value)
      end

      http
    end

    def get(url, header = {})
      uri = URI(url)
      res = http(uri).get(uri.request_uri, header)
    end

    def post(url, payload, header = {})
      uri = URI(url)
      http(uri).post(uri.request_uri, payload, header)
    end

    def put(url, payload, header = {})
      uri = URI(url)
      http(uri).put(uri.request_uri, payload, header)
    end

    def delete(url, header = {})
      uri = URI(url)
      http(uri).delete(uri.request_uri, header)
    end
  end
end