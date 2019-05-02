class Item < ApplicationRecord
  has_many   :comments
  has_many   :brands
  has_many   :images
  has_many   :profits
  has_many   :likes
  belongs_to :user
  has_many :carts, dependent: :destroy
  belongs_to :category

  has_many_attached :images

  enum condition: {brandNew: 0, nearUnused: 1, noDirt: 2, littleDirt: 3, dirt: 4, bad: 5}

  enum delivery_way: {undecided: 0, easyMercariPack: 1, postMail: 2, letterPack: 3, normalPost: 4, yamato: 5, postPack: 6, clickPost: 7, postPacket: 8}

  enum delivery_fee: {postageIncluded: 0, cashOnDelivery: 1}

  enum delivery_date: {fast: 0, normal: 1, slow: 2}

  enum delivery_area: {
    hokkaido: 1, aomori: 2, iwate: 3, miyagi: 4, akita: 5, yamagata: 6, fukushima: 7,
    ibaraki: 8, tochigi: 9, gunma: 10, saitama: 11, chiba: 12, tokyo: 13, kanagawa: 14,
    nigata: 15, toyama: 16, ishikawa: 17, fukui: 18, yamanashi: 19, nagano: 20,
    gifu: 21, shizuoka: 22, aichi: 23, mie: 24,
    shiga: 25, kyoto:26, osaka: 27, hyogo: 28, nara: 29,wakayama: 30,
    tottori: 31, shimane: 32, okayama: 33, hiroshima: 34, yamaguchi: 35,
    tokushima: 36, kagawa: 37, ehime: 38, kochi: 39,
    fukuoka: 40, saga: 41, nagasaki: 42, kumamoto: 43, oita: 44, miyazaki: 45, kagoshima: 46, okinawa: 47
  }

  enum size: {xxs: 0, xs: 1, s: 2, m: 3, l: 4, xl: 5, xl2: 6, xl3: 7, xl4: 8, free: 9}

  enum status: {exhibited: 0, sold: 1}

  validates :name, length: { maximum: 40 }, presence: true
  validates :description, length: { maximum: 1000 }, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, presence: true
  validates :condition, presence: true
  validates :size, presence: true
  validates :delivery_way, presence: true
  validates :delivery_fee, presence: true
  validates :delivery_date, presence: true
  validates :delivery_area, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :images, presence: true

  def insert_comma
    self.price = (price * 1.08).round
  end

  scope :recent, -> {order('created_at desc').limit(4)}
end
