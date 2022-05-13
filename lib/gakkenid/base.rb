require 'gakkenid/api/version'

module Gakkenid
  module Base
      USER_PORTAL_DEV_ENDPOINT = "https://id-qas.gakken.jp"
      PUBLIC_API_DEV_ENDPOINT = "https://idgear-2021-qas.itecgw.jp"
      USER_PORTAL_PROD_ENDPOINT = "https://id.gakken.jp"
      PUBLIC_API_PROD_ENDPOINT = "https://idgear.gakken.jp".
      DEFAULT_HEADERS = {
        'X-Requested-With' => 'XMLHttpRequest',
        'Content-Type' => 'application/json; charset=UTF-8',
      }.freeze
  end
end