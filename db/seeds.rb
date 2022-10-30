# frozen_string_literal: true

account = Account.find_or_initialize_by(
  username: 'admin',
  is_system_admin: true
)
if account.new_record?
  account.update!(password: 'password', password_confirmation: 'password')
end

accounts = []
100.times.each do |n|
  account = Account.new(username: "testuser_#{n}")
  account.assign_attributes(password: 'password', password_confirmation: 'password')
  accounts << account
end
Account.import accounts

ranking = Ranking.find_or_create_by!(
  title: '好きな漫画',
  genre: Ranking::Genre::ENTERTAINMENT,
  creator: account
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

Item.all.each do |item|
  Item.reset_counters(item.id, :likes)
end
