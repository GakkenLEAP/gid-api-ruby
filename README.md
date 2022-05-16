# Gakkenid-API-Ruby
学研IDAPI連携やログイン機能を実装するためのラッパーライブラリです。
オープンレポジトリで運用します。

## 環境変数を設定する

```bash
export GID_SERVICE_CODE = <your service code>
export GID_CLIENT_SECRET_TOKEN = <your client secret token>
export GID_ADMIN_ACCESS_TOKEN = <your admin access token>
```

## 開発環境構築と開発手順
`docker-compose build`

`docker-compose up -d`

で環境構築が完了。

その後は自由に開発。

`docker-compose run app rake build`
でgemを./pkgにbuildを行う。

`docker-compose run app gem install pkg/gakkenid-xxxx.gem`
で生成されたgemをinstall。

`docker-compose run app irb`
でirbを起動する。

    Creating gakkenid_app_run ... done
    irb(main):001:0> require 'gakkenid'
    => true

となればOK。