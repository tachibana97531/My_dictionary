# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email:"tachibana97531@icloud.com",
    password:"111111",
    )
    
Tag.create!([
  {tag_name:"総記"},
  {tag_name:"哲学"},
  {tag_name:"歴史"},
  {tag_name:"社会科学"},
  {tag_name:"自然科学"},
  {tag_name:"工学"},
  {tag_name:"産業"},
  {tag_name:"芸術"},
  {tag_name:"言語"},
  {tag_name:"文学"},
  {tag_name:"その他"}
  ])