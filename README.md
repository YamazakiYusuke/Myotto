# README

# Мёд (Myotto) ~パブリックドメイン本で言語学習~

## 概要
学習言語の著作権フリーの本を翻訳し、ユーザー同士で添削し合うサービス

## コンセプト
パブリックドメイン本で言語学習

## バージョン
Ruby 2.6.5
Rails 5.2.4.4

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] メールアドレス、名前、パスワード、母国語、学習言語は必須
- [ ] 投稿翻訳一覧表示機能
  - [ ] 投稿内容から単語で検索
- [ ] 投稿翻訳詳細表示機能
  - [ ] いいね！機能（投稿者以外）
    - [ ] ブログのお気に入りについては1つのブログに対して1人1回しかできない
  - [ ] 添削・コメント投稿機能
  - [ ] 添削・コメント削除機能
  - [ ] 添削・コメント編集機能
- [ ] User詳細機能
  - [ ] プロフィールの編集機能（投稿者のみ）
  - [ ] フォロー機能
  - [ ] フォロー・フォロワー一覧表示
  - [ ] DM機能
  - [ ] Userの今までの翻訳一覧表示
- [ ] 翻訳編集機能（投稿者のみ）
- [ ] 翻訳削除機能（投稿者のみ）
- [ ] 本の一覧機能
- [ ] 本の詳細機能
  - [ ] 本の翻訳投稿機能
- [ ] 本の追加リクエスト(メール)
- [ ] 新しい本の登録機能(管理者のみ)

## カタログ設計
https://docs.google.com/spreadsheets/d/1VUozG8H56CQB60y1Pc0Rv7HI3SjVTnKOvOKsq66z770/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1-NZcHTi_ozqowg-eqPkDDckepC2eD0nr1bOybYSv8ZQ/edit?usp=sharing

## 画面遷移図
https://drive.google.com/file/d/1Tn1uPXLUx6qPa3GbSBbVBDtCZ7ViNrlF/view?usp=sharing

## 画面ワイヤーフレーム
https://drive.google.com/file/d/1mvdlSxbKgIF0-QmIiSlOdS-JbJT0poE5/view?usp=sharing

## 使用予定Gem
* carrierwave
* mini_magick
* devise
