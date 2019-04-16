## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_kana|string|null: false|
|first_kana|string|null: false|
|avatar|string|
|profile|text|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|cellphone_id|references|foreign_key: true|
|address_id|references|foreign_key: true|
|payment_id|references|foreign_key: true|


### Association
- has_many :items
- has_many :likes
- has_many :comments
- has_many :carts
- has_one  :cellphone
- has_one  :address
- has_one  :payment


## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|fullname|string|null: false|
|fullname_kana|string|null: false|
|post_num|integer|null: false|
|city|string|null: false|
|block_num|string|null: false|
|building_name|string|
|prefecture_id|references|null: false|


### Association
- has_one :user


## Cellphonesテーブル
|Column|Type|Options|
|------|----|-------|
|phone_num|string|null: false|


### Association
- has_one :user


## Paymentsテーブル
|Column|Type|Options|
|------|----|-------|


### Association
- has_one :user




## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|size|integer|null: false|
|condition|integer|null: false|
|delivery_fee|integer|null: false|
|delivery_date|integer|null: false|
|delivery_area|integer|null: false|
|delivery_way|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|image_id|references|null: false, foreign_key: true|


###Association
- has_many   :comments
- has_many   :images
- has_many   :profits
- has_many   :likes
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_one    :cart



## Cartsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one    :item



## Comments

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item



## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
-belongs_to :user
-belongs_to :item



## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|

### Association
- has_many   :item
- has_many   :brand_categories
- has_many   :categories, through: :brand_categories



## Brand_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|references :brand|foreign_key: true|
|category_id|references :categpry|foreign_key: true|

### Association
- belongs_to :brand
- belongs_to :category



## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item



## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|integer|

### Association
- has_many :items
- has_many :brands
- has_many :brands, through: :brand_categories





