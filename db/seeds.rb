# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@login.com', password: 'Qh7Zu8SP', password_confirmation: 'Qh7Zu8SP')

## カテゴリー
print 'Create Category'
load(Rails.root.join('db/data/categories.rb'))

## オタク用語
print 'Create word'
load(Rails.root.join('db/data/words.rb'))

print 'done!'
