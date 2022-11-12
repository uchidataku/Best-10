# frozen_string_literal: true

return unless Rails.env.development?

admin_account = Account.find_by(is_system_admin: true)

## 漫画
ranking = Ranking.find_or_create_by!(
  title: '好きな漫画',
  creator: admin_account
)
RankingGenre.find_or_create_by!(
  ranking: ranking, genre: Genre.find_by(name: '漫画')
)

names = %w[
  OnePiece 呪術廻戦 進撃の巨人 スラムダンク ハンターハンター
  キングダム ドラゴンボール チェンソーマン ナルト ヒカルの碁
  テニスの王子様 アイシールド21 SPYxFAMILY あひるの空 金色のガッシュ
]

likes = []
names.each do |name|
  item = Item.find_or_create_by!(name: name, ranking: ranking)
  rand(1..100).times.each do |n|
    likes << Like.new(item: item, account: Account.find_by(username: "testuser_#{n}"))
  end
end
Like.import likes

## 映画
ranking = Ranking.find_or_create_by!(title: 'おすすめ洋画', creator: admin_account)
RankingGenre.find_or_create_by!(
  ranking: ranking, genre: Genre.find_by(name: '映画')
)

names = %w[
  BackToTheFuture アルマゲドン グレイテストショーマン E.T. ショーシャンクの空に
  インセプション マトリックス ロードオブザリング バイオハザード マンマミーア
  ジュマンジ ジュラシックパーク ターミネーター インディージョーンズ ベンジャミンバトン
]

likes = []
names.each do |name|
  item = Item.find_or_create_by!(name: name, ranking: ranking)
  rand(1..100).times.each do |n|
    likes << Like.new(item: item, account: Account.find_by(username: "testuser_#{n}"))
  end
end
Like.import likes

## プログラミング言語
ranking = Ranking.find_or_create_by!(title: '好きなプログラミング言語', creator: admin_account)
RankingGenre.find_or_create_by!(
  ranking: ranking, genre: Genre.find_by(name: 'プログラミング')
)

names = %w[
  Ruby Rust Go Java C C# C++
  Perl PHP Python Swift Kotlin
  JavaScript TypeScript Dart Nim
]

likes = []
names.each do |name|
  item = Item.find_or_create_by!(name: name, ranking: ranking)
  rand(1..100).times.each do |n|
    likes << Like.new(item: item, account: Account.find_by(username: "testuser_#{n}"))
  end
end
Like.import likes

## 動物
ranking = Ranking.find_or_create_by!(title: '好きな動物', creator: admin_account)
RankingGenre.find_or_create_by!(
  ranking: ranking, genre: Genre.find_by(name: '動物全般')
)

names = %w[
  犬 猫 ライオン シマウマ キリン ヘビ パンダ サル 馬 羊 ハムスター ラクダ
  アルパカ 白鳥 トラ フラミンゴ フクロウ サメ ラッコ シャチ クジラ エイ
]

likes = []
names.each do |name|
  item = Item.find_or_create_by!(name: name, ranking: ranking)
  rand(1..100).times.each do |n|
    likes << Like.new(item: item, account: Account.find_by(username: "testuser_#{n}"))
  end
end
Like.import likes

## 大学
ranking = Ranking.find_or_create_by!(title: 'おすすめ私立大学', creator: admin_account)
[Genre.find_by!(name: '大学・大学院'), Genre.find_by!(name: '教育全般')].each do |genre|
  RankingGenre.find_or_create_by!(ranking: ranking, genre: genre)
end


names = %w[
  慶應義塾大学 早稲田大学 上智大学 明治大学 中央大学 法政大学 青山学院大学 立教大学 学習院大学
  明治学院大学 成蹊大学 成城大学 立命館大学 関西学院大学 同志社大学 東京理科大学 東京女子大学
]

likes = []
names.each do |name|
  item = Item.find_or_create_by!(name: name, ranking: ranking)
  rand(1..100).times.each do |n|
    likes << Like.new(item: item, account: Account.find_by(username: "testuser_#{n}"))
  end
end
Like.import likes

## 邦楽
ranking = Ranking.find_or_create_by!(title: '絶対聴くべき邦楽アーティスト', creator: admin_account)
[Genre.find_by!(name: '邦楽'), Genre.find_by!(name: 'ロック'), Genre.find_by!(name: 'ポップス')].each do |genre|
  RankingGenre.find_or_create_by!(ranking: ranking, genre: genre)
end


names = %w[
  KingGnu Mr.Children 藤井風 東京事変 ケツメイシ 宇多田ヒカル あいみょん Vaundy
  YOASOBI 嵐 SMAP RADWIMPS MONGOL800 HY BiSH ゆず 緑黄色社会 松任谷由実 星野源
  福山雅治 久石譲 平井堅 秦基博 玉置浩二 スーパーカー スキマスイッチ サザンオールスターズ
  桑田佳祐 サカナクション サンボマスター 椎名林檎 斉藤和義 米米CLUB コブクロ くるり
  久保田利伸 倉木麻衣 銀杏BOYZ 木村カエラ 加藤登紀子 小田和正 奥田民生 ウルフルズ
  いきものがかり ELLEGARDEN 絢香 安室奈美恵 19 ZARD Superfly Suchmos SPEED
  PUFFY Perfume MISIA GLAY globe GReeeeN EXILE DEEN Cocco CHEMISTRY B'z
  AKB48 AI Ado 米津玄師 優里 ゆらゆら帝国 山下達郎 槙原敬之 ポルノグラフィティ 柴咲コウ
]

likes = []
names.each do |name|
  item = Item.find_or_create_by!(name: name, ranking: ranking)
  rand(1..100).times.each do |n|
    likes << Like.new(item: item, account: Account.find_by(username: "testuser_#{n}"))
  end
end
Like.import likes

## 料理
ranking = Ranking.find_or_create_by!(title: '自信のある手料理', creator: admin_account)
RankingGenre.find_or_create_by!(
  ranking: ranking, genre: Genre.find_by(name: 'グルメ/料理全般')
)

names = %w[
  肉じゃが 生姜焼き ビーフシチュー 唐揚げ カレー 油淋鶏 ナポリタン カルボナーラ
  たらこパスタ ペペロンチーノ とり天 たこ焼き 焼きそば シチュー 筑前煮 ロールキャベツ
]

likes = []
names.each do |name|
  item = Item.find_or_create_by!(name: name, ranking: ranking)
  rand(1..100).times.each do |n|
    likes << Like.new(item: item, account: Account.find_by(username: "testuser_#{n}"))
  end
end
Like.import likes

## ダミー
rankings = []
(1..100).each do |n|
  rankings << Ranking.new(
    title: "ダミー#{n}",
    creator: admin_account
  )
end
Ranking.import rankings

items = []
(1..100).each do |n|
  ranking = Ranking.find_by(title: "ダミー#{n}")
  (1..10).each do |m|
    items << Item.new(name: "content#{m}", ranking: ranking)
  end
end
Item.import items

## reset counter
Ranking.all.each do |r|
  Ranking.reset_counters(r.id, :items)
end

Item.all.each do |item|
  Item.reset_counters(item.id, :likes)
end
