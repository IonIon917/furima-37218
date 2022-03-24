# User

|Column             |Type  |Options            |
|-------------------|------|-------------------|
|nickname           |string|null:false         |
|email              |string|UNIQUE null:false  |
|encrypted_password |string|null:false         |
|name               |string|null:false 苗字と名前|
|name_kana          |string|null:false         |
|birth_day          |string|null:false         |

## Association
has_many: Items
has_many: Purchases
has_many: Address


# Item

|Column      |Type     |Options            |
|------------|---------|-------------------|
|image       |         |                   |
|introduction|text     |null:false         |
|item_name   |string   |null:false         |
|category    |string   |11項目からの選択     |
|status      |string   |6項目からの選択      |
|ship_form   |string   |48項目             |
|item_value  |string   |¥300~9,999,999     |
|user_id     |reference|外部キー            |

## Association
belongs_to: User
belongs_to: Purchase
belongs_to: Address


# Purchase

|Column      |Type     |Options            |
|------------|---------|-------------------|
|user_id     |reference|外部キー            |
|item_id     |reference|外部キー            |
|address_id  |reference|外部キー            |

## Association
belongs_to: User
belongs_to: Item
belongs_to: Address


# Address

|Column      |Type     |Options                  |
|------------|---------|-------------------------|
|user_id     |reference|外部キー                  |
|item_id     |reference|外部キー                  |
|post_code   |string   |3桁-4桁, null:false      |
|prefectures |string   |47都道府県                |
|city        |string   |null:false               |
|building    |string   |任意                     |
|tell        |string   |ハイフンなし,10桁以上11桁以内|

## Association
belongs_to: User
belongs_to: Item
belongs_to: Purchase