# Users

|Column             |Type  |Options               |
|-------------------|------|----------------------|
|nickname           |string|null:false            |
|email              |string|unique:true null:false|
|encrypted_password |string|null:false            |
|first_name         |string|null:false            |
|last_name          |string|null:false            |
|first_name_kana    |string|null:false            |
|last_name_kana     |string|null:false            |
|birth_day          |date  |null:false            |

## Association
has_many: items
has_many: purchases



# Items

|Column            |Type      |Options            |
|------------------|----------|-------------------|
|introduction      |text      |null:false         |
|item_name         |string    |null:false         |
|category_id       |integer   |                   |
|status_id         |integer   |                   |
|ship_form_id      |integer   |                   |
|item_value        |string    |                   |
|user              |references|foreign_key:true   |
|delivery_charge_id|integer   |                   |
|days_to_ship_id   |integer   |                   |

## Association
belongs_to: user
has_one: purchase



# Purchases

|Column   |Type      |Options            |
|---------|----------|-------------------|
|user     |references|foreign_key:true   |
|item     |references|foreign_key:true   |

## Association
belongs_to: user
belongs_to: item
has_one: address


# Addresses

|Column         |Type      |Options                  |
|---------------|----------|-------------------------|
|purchase       |references|foreign_key:true         |
|post_code      |string    |null:false               |
|ship_form_id   |integer   |                         |
|city           |string    |null:false               |
|building       |string    |                         |
|tell           |string    |                         |

## Association
belongs_to: purchase