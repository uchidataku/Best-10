# frozen_string_literal: true

genre_categories = [
  { name: 'エンタメ・趣味', genres: %w[
    エンタメ全般
    趣味全般
    芸能
    ドラマ
    映画
    お笑い
    TV・ラジオ
    ゲーム
    アニメ
    CD・DVD
    ホビー
    楽器・音楽機材
    本・雑誌
    漫画
    カラオケ
    風呂・サウナ
    ギャンブル・占い
    茶道・華道
    その他エンタメ・趣味
  ] },
  { name: '音楽', genres: %w[
    音楽全般
    邦楽
    洋楽
    ロック
    ポップス
    ファンク
    ジャズ
    メタル
    ヒップホップ
    R&B
    K-POP
    レゲエ
    ダンス
    エレクトロニック
    アニメ音楽
    クラシック
    歌謡曲・演歌
    ワールドミュージック
    その他音楽
  ] },
  { name: '自然', genres: %w[
    自然全般
    山
    空
    海
    陸
    植物
    生物
    宇宙
    天体
    島
    その他自然
  ] },
  { name: '政治・経済・社会・ライフスタイル', genres: %w[
    政治全般
    経済全般
    社会全般
    ライフスタイル全般
    法律・社会制度
    男性ライフスタイル
    女性ライフスタイル
  ] },
  { name: '動物', genres: %w[
    動物全般
    人間
    犬
    猫
    ペット
    その他動物
  ] },
  { name: 'ファッション', genres: %w[
    ファッション全般
    男性ファッション
    女性ファッション
    キッズ・ベビーファッション
    インナー・下着
    バッグ・小物・ブランド雑貨
    靴
    腕時計
    ジュエリー・アクセサリー
    その他ファッション
  ] },
  { name: 'スポーツ', genres: %w[
    スポーツ全般
    サッカー
    野球
    バスケットボール
    バレーボール
    テニス
    水泳
    卓球
    ゴルフ
    ラグビー
    アメリカンフットボール
    バドミントン
    陸上
    スキー・スノーボード
    格闘技
    モータースポーツ
    相撲
    柔道
    剣道
    空手
    体操
    その他スポーツ
  ] },
  { name: '住まい・アウトドア', genres: %w[
    住まい全般
    日用品雑貨・文房具・手芸
    眼鏡・コンタクト
    インテリア・収納
    寝具・ベッド・マットレス
    キッチン用品・食器・調理器具
    花・観葉植物
    ガーデン・DIY・工具
    住宅・リフォーム
    アウトドア全般
    キャンプ・BBQ
    釣り・登山
  ] },
  { name: '乗り物', genres: %w[
    乗り物全般
    車
    バイク
    自転車
    電車
    飛行機
    船
    その他乗り物
  ] },
  { name: '美容・健康', genres: %w[
    美容全般
    健康全般
    理容
    ネイル
    エステ
    ヨガ
    ダイエット
    コスメ
    香水
    その他美容・健康
  ] },
  { name: '職業', genres: %w[
    職業全般
    医療系
    美容・ファッション系
    飲食系
    教育・研究・保育系
    出版・報道系
    音楽・ラジオ系
    スポーツ系
    デザイン・広告・アート系
    法律・士業・政治系
    金融・コンサル系
    建築・インテリア・不動産系
    オフィス・職種系
    運輸・輸送系
    葬祭・宗教系
    心理・福祉・リハビリ系
    旅行・ホテル系
    販売系
    自然・動物系
    テレビ・映画系
    芸能・ネット系
    マンガ・アニメ・ゲーム系
    IT・Web系
    公務員系
    国際系
    事務・秘書系
    保安系
    その他職業
  ] },
  { name: 'ファミリー・キッズ', genres: %w[
    ファミリー全般
    キッズ全般
    ベビー・マタニティ
    おもちゃ
  ] },
  { name: 'グルメ/料理・食品/飲料', genres: %w[
    グルメ/料理全般
    食品/飲料全般
    和食・日本料理
    洋食・西洋料理
    中華
    イタリアン
    ラーメン・麺類
    ファミレス・ファーストフード
    居酒屋・バー
    カフェ・喫茶店
    寿司・魚料理
    焼肉・ステーキ
    焼鳥・串料理
    お好み焼・粉物
    丼物・揚げ物
    アジア・エスニック
    ビュッフェ・バイキング
    スイーツ・お菓子
    水・ソフトドリンク
    ビール・洋酒・ワイン
    日本酒・焼酎・その他酒
    その他グルメ/料理
  ] },
  { name: 'ビジネス・教養・IT', genres: %w[
    ビジネス全般
    教養全般
    IT全般
    国内企業
    外資企業
    副業
    自己啓発
    スキル
    インターネット
    Webサービス
    プログラミング
    AI
    最先端技術
  ] },
  { name: '旅行・お出かけ・施設', genres: %w[
    旅行全般
    お出かけ全般
    施設全般
    国内旅行
    海外旅行
    アクティビティ
    レジャー施設・スポーツ施設
    公園
  ] },
  { name: '教育・学問', genres: %w[
    教育全般
    学問全般
    幼児教育
    小学校
    中学校
    高等学校
    大学・大学院
    専門学校
    その他学校
  ] },
  { name: '医療', genres: %w[
    医療全般
    看護
    医薬品
    内科
    外科
    歯科
    眼科
    皮膚科
    小児科
    産婦人科
    精神科
    その他診療科目
  ] },
  { name: 'サービス・商品・家電', genres: %w[
    サービス全般
    商品全般
    保険
    介護
    家電全般
    TV・オーディオ・カメラ
    PC・周辺機器
    スマートフォン・タブレット
    生活家電
    ペットフード・ペット用品
    車用品・バイク用品
    キャンプ・アウトドア用品
    その他商品
  ] }
]

genres = []
genre_categories.each do |genre_category|
  gc = GenreCategory.find_or_create_by!(name: genre_category[:name])
  genre_category[:genres].each do |genre|
    genres << Genre.find_or_initialize_by(name: genre, genre_category: gc)
  end
end
Genre.import genres
