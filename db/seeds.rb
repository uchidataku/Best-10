# frozen_string_literal: true

admin_account = Account.find_or_initialize_by(
  username: 'admin',
  is_system_admin: true
)
if admin_account.new_record?
  admin_account.update!(password: 'password', password_confirmation: 'password')
end

accounts = []
100.times.each do |n|
  account = Account.new(username: "testuser_#{n}")
  account.assign_attributes(password: 'password', password_confirmation: 'password')
  accounts << account
end
Account.import accounts

## 漫画
ranking = Ranking.find_or_create_by!(
  title: '好きな漫画',
  genre: Ranking::Genre::ENTERTAINMENT,
  creator: admin_account
)

titles = %w[
OnePiece 呪術廻戦 進撃の巨人 スラムダンク ハンターハンター
キングダム ドラゴンボール チェンソーマン ナルト ヒカルの碁
テニスの王子様 アイシールド21 SPYxFAMILY あひるの空 金色のガッシュ
]

likes = []
titles.each do |title|
  item = Item.find_or_create_by!(name: title, ranking: ranking)
  rand(1..100).times.each do |n|
    likes << Like.new(item: item, account: Account.find_by(username: "testuser_#{n}"))
  end
end
Like.import likes

## 映画
ranking = Ranking.find_or_create_by!(
  title: 'おすすめ洋画',
  genre: Ranking::Genre::ENTERTAINMENT,
  creator: admin_account
)

titles = %w[
BackToTheFuture アルマゲドン グレイテストショーマン E.T. ショーシャンクの空に
インセプション マトリックス ロードオブザリング バイオハザード マンマミーア
ジュマンジ ジュラシックパーク ターミネーター インディージョーンズ ベンジャミンバトン
]

likes = []
titles.each do |title|
  item = Item.find_or_create_by!(name: title, ranking: ranking)
  rand(1..100).times.each do |n|
    likes << Like.new(item: item, account: Account.find_by(username: "testuser_#{n}"))
  end
end
Like.import likes

# プログラミング言語
ranking = Ranking.find_or_create_by!(
  title: '好きなプログラミング言語',
  genre: Ranking::Genre::IT,
  creator: admin_account
)

titles = %w[
Ruby Rust Go Java C C# C++
Perl PHP Python Swift Kotlin
JavaScript TypeScript Dart Nim
]

likes = []
titles.each do |title|
  item = Item.find_or_create_by!(name: title, ranking: ranking)
  rand(1..100).times.each do |n|
    likes << Like.new(item: item, account: Account.find_by(username: "testuser_#{n}"))
  end
end
Like.import likes

Item.all.each do |item|
  Item.reset_counters(item.id, :likes)
end
