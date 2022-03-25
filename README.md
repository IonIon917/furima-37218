# Users

|Column             |Type  |Options            |
|-------------------|------|-------------------|
|nickname           |string|null:false         |
|email              |string|UNIQUE null:false  |
|encrypted_password |string|null:false         |
|first_name         |string|null:false         |
|last_name          |string|null:false         |
|first_name_kana    |string|null:false         |
|last_name_kana     |string|null:false         |
|birth_day          |date  |null:false         |

## Association
has_many: items
has_many: purchases
has_many: address


# Items

|Column      |Type      |Options            |
|------------|----------|-------------------|
|introduction|text      |null:false         |
|item_name   |string    |null:false         |
|category    |string    |11項目からの選択     |
|status      |string    |6項目からの選択      |
|ship_form   |string    |48項目             |
|item_value  |string    |¥300~9,999,999     |
|user_id     |references|foreign_key:true   |

## Association
belongs_to: user
belongs_to: purchase
belongs_to: address


# Purchases

|Column      |Type      |Options            |
|------------|----------|-------------------|
|user_id     |references|foreign_key:true   |
|item_id     |references|foreign_key:true   |

## Association
belongs_to: user
belongs_to: item
belongs_to: address


# Addresses

|Column      |Type      |Options                  |
|------------|----------|-------------------------|
|purchase_id |references|foreign_key:true         |
|post_code   |string    |3桁-4桁, null:false       |
|ship_form   |string    |48項目,Itemsの使い回す      |
|city        |string    |null:false               |
|building    |string    |                         |
|tell        |string    |ハイフンなし,10桁以上11桁以内|

## Association
belongs_to: user
belongs_to: item
belongs_to: purchase