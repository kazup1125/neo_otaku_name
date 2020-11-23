# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin_attributes = [
  {
    email: 'admin@login.com',
    password: 'Qh7Zu8SP'
  }
]

admin_attributes.each do |attribute|
  AdminUser.find_or_create_by!(email: attribute[:email]) do |admin_user|
    admin_user.assign_attributes(attribute)
  end
end

## カテゴリー
print 'Create Category'
load(Rails.root.join('db/data/categories.rb'))

## オタク用語
print 'Create word'
load(Rails.root.join('db/data/words.rb'))

print 'done!'
