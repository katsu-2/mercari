## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_kana|string|null: false|
|first_kana|string|null: false|
|phone_number|integer|unique: true|
|avatar|string|
|profile|text|
|birth_year|integer|
|birth_month|integer|
|birth_day|integer|
|post_num|integer|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|block_num|string|null: false|
|building_name|string|

### Association
- has_many :items
- has_many :profits
- has_many :likes
- has_many :comments
- belongs_to :cart



## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|size|string|null: false|
|condition|string|null: false|
|delivery_fee|string|null: false|
|delivery_date|string|null: false|
|delivery_way|string|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|comment_id|references|null: false, foreign_key: true|
|image_id|references|null: false, foreign_key: true|
|like_id|references|null: false, foreign_key: true|

###Association
- has_many   :comments
- has_many   :brands
- has_many   :images
- has_many   :profits
- has_many   :likes
- belongs_to :user
- belongs_to :category
- belongs_to :cart



## Cartsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item



## Profitsテーブル
|Column|Type|Options|
|------|----|-------|
|profit|integer|
|profit_log|string|
|expiration_date|daytime|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item



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
|category_id|references|foreign_key: true|

### Association
- belongs_to :item
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





