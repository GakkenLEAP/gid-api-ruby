require 'gakkenid/client'

def create_users

  @client ||= Gakkenid::Client.new({
    gid_env: 'gid_env',
    service_code: 'service_code',
    client_secret_token: 'client_secret_token',
    admin_access_token: 'admin_access_token'
    })

  users =
    {
      "user_list":
      [
        {
          "gid": "gid_gakken_taro",
          "pass":"gid_gakken_taro_pass",
          "mailaddress_1": "",
          "mailaddress_2": "",
          "mailaddress_3": "",
          "mobile": "",
          "lastname": "学研",
          "firstname": "太郎",
          "kana_lastname": "ガッケン",
          "kana_firstname": "タロウ",
          "birth": "2000-01-01",
          "nickname": "",
          "sex": 0,
          "country": "JPN",
          "zip": "",
          "tel": "",
          "tel_2": "",
          "address_2": "",
          "address_3": "",
          "address_4": "",
          "address_5": "",
          "address_6": "",
          "family_type": 1,
          "directmail_flg": 0,
          "payment_not_flg": 0,
          "agree_flg": 1,
          "ext_1": "",
          "ext_2": "",
          "ext_3": "",
          "data_util_agree_flg": 1
        }
      ]
    }
  @client.create_user_bulk(users.to_json)
end
