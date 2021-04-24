# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Customer.create!(
   email: 'tanaka@jp',
   password: '123456',
   last_name: '田中',
   first_name: '太郎',
   last_name_kana: 'タナカ',
   first_name_kana: 'タロウ',
   postal_code: '000-0000',
   address: '東京都',
   phone_number: '123-456',
   is_deleted: 'false'
)

Manager.create!(
   email: 'test@com',
   password: '123456'
)