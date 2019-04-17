class Item < ApplicationRecord
  has_many   :comments
  has_many   :brands
  has_many   :images
  has_many   :profits
  has_many   :likes
  # belongs_to :user
  # belongs_to :category
  # belongs_to :cart

  enum condition:       {"新品、未使用": 0, "未使用に近い": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5}

  enum delivery_way: {"未定": 0, "らくらくメルカリ便": 1, "ゆうメール": 2, "レターパック": 3, "普通郵便(定形、定形外)": 4, "クロネコヤマト": 5, "ゆうパック": 6, "クリックポスト": 7, "ゆうパケット": 8}

  enum delivery_fee: {"送料込み(出品者負担)": 0, "着払い(購入者負担)": 1}

  enum delivery_date: {"1~2日で発送": 0, "2~3日で発送": 1, "4~7日で発送": 2}

  enum delivery_area: {
    "北海道": 1, "青森県": 2, "岩手県": 3, "宮城県": 4, "秋田県": 5, "山形県": 6, "福島県": 7,
    "茨城県": 8, "栃木県": 9, "群馬県": 10, "埼玉県": 11, "千葉県": 12, "東京都": 13, "神奈川県": 14,
    "新潟県": 15, "富山県": 16, "石川県": 17, "福井県": 18, "山梨県": 19, "長野県": 20,
    "岐阜県": 21, "静岡県": 22, "愛知県": 23, "三重県": 24,
    "滋賀県": 25, "京都府":26, "大阪府": 27, "兵庫県": 28, "奈良県": 29,"和歌山県": 30,
    "鳥取県": 31, "島根県": 32, "岡山県": 33, "広島県": 34, "山口県": 35,
    "徳島県": 36, "香川県": 37, "愛媛県": 38, "高知県": 39,
    "福岡県": 40, "佐賀県": 41, "長崎県": 42, "熊本県": 43, "大分県": 44, "宮崎県": 45, "鹿児島県": 46, "沖縄県": 47
  }

  enum size: {"XXS以下": 0, "XS(SS)": 1, "S": 2, "M": 3, "L": 4, "XL": 5, "2XL": 6, "3XL": 7, "4XL": 8, "5XL": 9, "FREESIZE": 10}

  # enum status: {published: 0, stopped: 1, trading: 2, sold: 3}

  validates :name, length: { maximum: 40 }, presence: true
  validates :description, length: { maximum: 1000 }, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, presence: true
  validates :condition, presence: true
  validates :size, presence: true
  validates :delivery_way, presence: true
  validates :delivery_fee, presence: true
  validates :delivery_date, presence: true
  validates :delivery_area, presence: true
  # validates :user_id, presence: true
end
