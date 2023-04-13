# wordpress

## Wordpressサーバー

### サーバー起動

```shell
docker-compose up -d
```

### サーバーアクセス

ホームページ： <http://localhost/>
ホームページ： <http://localhost/wp-login.php>

## フォルダー構成

```text
├── /wp-admin
│   ├── /css
│   ├── /images
│   ├── ・・・
│   └── index.php
├── /wp-content
│   ├── /plugins
│   ├── /themes
│   └── index.php
├── /wp-includes
│   ├── /assets
│   ├── /css
│   ├── ・・・
│   └── version.php
├── .htaccess
├── index.php
├── wp-activate.php
├── wp-blog-header.php
├── wp-comments-post.php
├── wp-config-docker.php
├── wp-config-sample.php
├── wp-cron.php
├── wp-links-opml.php
├── wp-load.php
├── wp-login.php
├── wp-mail.php
├── wp-settings.php
├── wp-signup.php
├── wp-trackback.php
└── xmlrpc.php
```

## 参照

1. [wordpress image](https://hub.docker.com/_/wordpress)
