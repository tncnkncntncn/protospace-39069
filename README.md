# テーブル設計

## users テーブル　

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false,unique :true |
| encrypted_password | string | null: false              |
| profile            | text   | null:false               |
| occupation         | text   | null: false              |
| position           | text   | null:false               |

- has_many:comments
- has_many:prototypes


## comments テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
|content  | text       | null:false                     |
|prototype| references | null: false, foreign_key: true |
|user     | references | null: false, foreign_key: true |

- belongs_to:users
- belongs_to:prototypes


## prototypes テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| title       | string     | null: false                    |
| cath_copy   | text       | null: false                    |
| concept     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

- has_many:comments
- belongs_to:users