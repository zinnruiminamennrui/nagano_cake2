# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Customer.create!(
   #email: 'tanaka@jp',
   #password: '123456',
   #last_name: '田中',
   #first_name: '太郎',
   #last_name_kana: 'タナカ',
   #first_name_kana: 'タロウ',
   #postal_code: '000-0000',
   #address: '東京都',
   #phone_number: '123-456',
   #is_deleted: 'false'
#)

4.times do |n|
   Customer.create!(
      email: "tanaka#{n + 1}@jp",
      password: '123456',
      last_name: '田中',
      first_name: "太郎#{n + 1}",
      last_name_kana: 'タナカ',
      first_name_kana: "タロウ#{n + 1}",
      postal_code: '000-0000',
      address: '東京都',
      phone_number: '123-456',
      is_deleted: 'false'
    )
  end

Genre.create!(
   name: "ケーキ",
)

Genre.create!(
   name: "プリン",
)

Genre.create!(
   name: "焼き菓子",
)

Genre.create!(
   name: "キャンディ",
)

Product.create!(
      genre_id: 2,
      name: 'ショートケーキ',
      introduction: 'いちごのショートケーキです',
      price: '350',
      image: File.open('./app/assets/images/no_image.jpg'),
      is_active: 'true'
)

#Manager.create!(
   #email: 'test@com',
   #password: '123456'
#)