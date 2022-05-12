require 'base64'
require 'net/http'
require 'openssl'
require 'uri'

module Gakkenid


  # API Client of GakkenID Ruby
  #
  #   @client ||= GakkenId::Client.new do |config|
  #     config.env = "prod" or "dev"
  #     config.service_code = ENV["SERVICE_CODE"]
  #     config.client_secret_token = ENV["CLIENT_SECRET_TOKEN"]
  #     config.admin_access_token = ENV["ADMIN_ACCESS_TOKEN"]
  #   end
  class Client
    # @return[String]
    attr_accessor :client_secret_token, :admin_access_token, :user_portal_endpoint, :public_api_endpoint

    # @return[Object]
    attr_accessor :httpclient

    # @return[Hash]
    attr_accessor :http_options

    def initialize(options ={})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end
    def httpclient
      @httpclient ||= HTTPClient.new(http_options)
    end

    def user_portal_endpoint
      @user_portal_endpoint ||= BASE::USER_PORTAL_DEV_ENDPOINT
    end

    def public_api_endpoint
      @public_api_endpoint ||= BASE::PUBLIC_API_DEV_ENDPOINT
    end


    def credentials
      {
        "Authorization" => "Basic #{encode64(@admin_access_token)}",
      }
    end

    # Create GakkenID User
    # @return [Net::HTTPResponse]
    def create_user_bulk(users)
      admin_access_token_required
      endpoint_path = '/user/bulk'
      post(endpoint, endpoint_path, users.to_json, credentials)
    end


    # Fetch data, get content of specified URL.
    #
    # @param endpoint_base [String]
    # @param endpoint_path [String]
    # @param headers [Hash]
    #
    # @return [Net::HTTPResponse]
    def get(endpoint_base, endpoint_path, headers = {})
      headers = BASE::DEFAULT_HEADERS.merge(headers)
      httpclient.get(endpoint_base + endpoint_path, headers)
    end

    # Post data, get content of specified URL.
    #
    # @param endpoint_base [String]
    # @param endpoint_path [String]
    # @param payload [String or NilClass]
    # @param headers [Hash]
    #
    # @return [Net::HTTPResponse]
    def post(endpoint_base, endpoint_path, payload = nil, headers = {})
      headers = BASE::DEFAULT_HEADERS.merge(headers)
      httpclient.post(endpoint_base + endpoint_path, payload, headers)
    end

    # Put data, get content of specified URL.
    #
    # @param endpoint_base [String]
    # @param endpoint_path [String]
    # @param payload [String or NilClass]
    # @param headers [Hash]
    #
    # @return [Net::HTTPResponse]
    def put(endpoint_base, endpoint_path, payload = nil, headers = {})
      headers = BASE::DEFAULT_HEADERS.merge(headers)
      httpclient.put(endpoint_base + endpoint_path, payload, headers)
    end

    # Delete content of specified URL.
    #
    # @param endpoint_base [String]
    # @param endpoint_path [String]
    # @param headers [Hash]
    #
    # @return [Net::HTTPResponse]
    def delete(endpoint_base, endpoint_path, headers = {})
      headers = BASE::DEFAULT_HEADERS.merge(headers)
      httpclient.delete(endpoint_base + endpoint_path, headers)
    end



    def client_secret_token_required
      raise ArgumentError, '`client_secret_token` is not configured' unless client_secret_token
    end

    def admin_access_token_required
      raise ArgumentError, '`admin_access_token` is not configured' unless admin_access_token
    end
  end
end