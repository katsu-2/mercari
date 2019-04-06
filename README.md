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
|user_id|references :user|null: false, foreign_key: true|
|category_id|references :category|null: false, foreign_key: true|
|second_category_id|references :second_category|null: false, foreign_key: true|
|third_category_id|references :third_category|null: false, foreign_key: true|
|brand_id|references :brand|null: false, foreign_key: true|
|comment_id|references :comment|null: false, foreign_key: true|
|image_id|references :image|null: false, foreign_key: true|
|like_id|references :like|null: false, foreign_key: true|



## Profitsテーブル
|Column|Type|Options|
|------|----|-------|
|profit|integer|
|profit_log|string|
|expiration_date|daytime|
|user_id|references :user|null: false, foreign_key: true|
|item_id|references :item|null: false, foreign_key: true|



## Comments

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references :user|null: false, foreign_key: true|
|item_id|references :item|null: false, foreign_key: true|



## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references :user|null: false, foreign_key: true|
|item_id|references :item|null: false, foreign_key: true|



## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|
|category_id|references :category|foreign_key: true|



## Brand_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|references :brand|foreign_key: true|
|category_id|references :categpry|foreign_key: true|



## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|



## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|



## Second_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_id|references :category|null: false, foreign_key: true|



## Third_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|second_category_id|references :second_category|null: false, foreign_key: true|




