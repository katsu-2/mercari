## Comments

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references :user|null: false, foreign_key: true|
|item_id|references :item|null: false, foreign_key: true|
