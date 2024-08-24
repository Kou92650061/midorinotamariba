# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

taro = User.find_or_create_by!(email: "taro@example.com") do |user|
  user.password = "password"
  user.name = "taro"
end

post_image = taro.post_images.find_or_create_by!(title: "aaa") do |post_image|
  post_image.body = "iii"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg")
end

yama = Tag.find_or_create_by!(name: "山")
kawa = Tag.find_or_create_by!(name: "川")
umi = Tag.find_or_create_by!(name: "海")
inaka = Tag.find_or_create_by!(name: "田舎")

post_image.post_tags.find_or_create_by!(tag_id: yama.id)
post_image.post_tags.find_or_create_by!(tag_id: inaka.id)
