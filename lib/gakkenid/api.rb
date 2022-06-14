# frozen_string_literal: true

module Gakkenid
  module API
    USER_PORTAL_DEV_ENDPOINT = "https://gateway.docker.internal:10443"
    PUBLIC_API_DEV_ENDPOINT = "https://idgear-2021-qas.itecgw.jp"
    USER_PORTAL_PROD_ENDPOINT = "https://id.gakken.jp"
    PUBLIC_API_PROD_ENDPOINT = "https://idgear.gakken.jp"

    DEFAULT_HEADERS = {
      'X-Requested-With' => 'XMLHttpRequest',
      'Content-Type' => 'application/json'
    }.freeze
  end
end
