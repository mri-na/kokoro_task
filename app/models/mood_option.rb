class MoodOption < ApplicationRecord
  belongs_to :optionable, polymorphic: true

  validates :colors, presence: true, length: { maximum: 3 }
  validates :labels, presence: true, length: { maximum: 3 }
# ジャーナルとタスクをカテゴリーごとに分ける
 # MOOD_LABELS = {
  #  "Person" => ["自分", "友達", "家族", "ペット"],
  #  "Life"   => ["仕事", "バイト", "勉強", "お金", "恋愛", "家事", "健康", "就職" ],
  #  "Hobby"  => ["食", "本", "音楽", "旅行", "美容", "ゲーム", "スポーツ", "お酒" ], 
  #  "Other"  => ["学校", "交通機関", "その他" ]
  #}
  # 感情と色をペアとして定義
  #MOOD_COLORS = {
    #"Positive" => {
    #  "満足" => "#FF6347",  # 赤系
    #  "感謝" => "#FF7F50",  # 橙系
    #  "嬉しい" => "#FFD700", # 黄色
    #  "ワクワク" => "#ADFF2F" # 黄緑
    #},
    #"Neutral" => {
    #  "安心" => "#00CED1",   # 青緑
    #  "穏やか" => "#1E90FF" # 青
    #},
    #"Negative" => {
    #  "疲れた" => "#778899", # 灰色
    #  "悲しい" => "#2F4F4F", # 暗緑
    #  "怒り" => "#8B0000"    # 暗赤
    #}
  #}

  # カテゴリ内のすべての色を取得するメソッド
  #def self.colors_for_category(category)
  #  MOOD_COLORS[category].values
  #end

  # カテゴリ内のすべての感情を取得するメソッド
  #def self.labels_for_category(category)
  #  MOOD_COLORS[category].keys
  #end
end

