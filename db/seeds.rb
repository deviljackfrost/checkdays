# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "seedの実行を開始"

olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  end

lucas = User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  end

PostContent.find_or_create_by!(title: "Cavello") do |post_image|
  post_image.caption = "大人気のカフェです。"
  post_image.user = olivia
end

PostContent.find_or_create_by!(title: "和食屋せん") do |post_image|
  post_image.caption = "日本料理は美しい！"
  post_image.user = james
end

PostContent.find_or_create_by!(title: "ShoreditchBar") do |post_image|
  post_image.caption = 'メキシコ料理好きな方にオススメ！'
  post_image.user = lucas
end

puts "seedの実行が完了しました"