# firehol
Scripts for FireHOL on Debian and Ubuntu

# やりたいこと
サーバを不正アクセスから守る
FireHOLで提供される不正アクセスをしているIPアドレス等を取得しTCPそうでブロック  
不正アクセスをする国を遮断
- ロシア
- 中国
- 大韓民国・朝鮮民主主義人民共和国

# 前提条件
このプロジェクトの前提条件を記載
- Debianのバージョン
- 完了(Apache ...)

# Installtion
インストール手順を記載
- apt update
- apt -y install firehol-tools netfilter-persistent
- apt -y install ipset firewalld
- Upload updata-blocklist.sh
- Upload summary.sh

# Configuration
- ipset作成
- firewalldを有効化
- update-ipsetsの実行
- firewalldにipsetの設定を
- 自動更新の設定
- ブロックの確認設定
