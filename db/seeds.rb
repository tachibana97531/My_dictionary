# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email:"admin@test.com",
    password:"111111",
    )

User.create!([
    {email:"tanaka@tarou.com",
    password:"222222",
      last_name:"田中",
    first_name:"太郎",
    last_name_kana:"たなか",
    first_name_kana:"たろう",
    postal_code:"2222222",
    address:"青森県青森市",
    telephone_number:"22222222222",
    is_deleted:"false"
    },
    {email:"satou@jirou.com",
    password:"333333",
      last_name:"佐藤",
    first_name:"次郎",
    last_name_kana:"さとう",
    first_name_kana:"じろう",
    postal_code:"3333333",
    address:"岩手県花巻市",
    telephone_number:"33333333333",
    is_deleted:"false"
    },
    {email:"reiwa@mitiko.com",
    password:"444444",
      last_name:"令和",
    first_name:"道子",
    last_name_kana:"れいわ",
    first_name_kana:"みちこ",
    postal_code:"4444444",
    address:"宮崎県大崎市",
    telephone_number:"44444444444",
    is_deleted:"false"
    }
  ])



Tag.create!([
  {tag_name:"買い物"},
  {tag_name:"店"},
  {tag_name:"歴史"},
  {tag_name:"植物"},
  {tag_name:"動物"},
  {tag_name:"名言"},
  {tag_name:"アニメ"},
  {tag_name:"漫画"},
  {tag_name:"英語"},
  {tag_name:"小説"},
  {tag_name:"メモ"}
  ])