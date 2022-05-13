require 'gakkenid/client'

def create_users

    @client ||= GakkenId::Client.new do |config|
      config.env = "dev"
      config.admin_access_token = ENV["ADMIN_ACCESS_TOKEN"]
    end

    user_list =  [
      {
        "gid": "gid_yoshioka",
        "pass":"gid_yoshioka_pass",
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
        "pref_cd": "1",
        "address_2": "",
        "address_3": "",
        "address_4": "",
        "address_5": "",
        "address_6": "",
        "family_cd": "",
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
    @client.create_user_bulk(user_list)
end