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
  
  ser.create!(
  name: "Admin User",
  email: "admin_test@example.com",
  password: "password",
  role: "admin"
)

PostContent.find_or_create_by!(title: "Cavello") do |post_content|
  post_content.caption = "大人気のカフェです。"
  post_content.user = olivia
end

PostContent.find_or_create_by!(title: "和食屋せん") do |post_content|
  post_content.caption = "日本料理は美しい！"
  post_content.user = james
end

PostContent.find_or_create_by!(title: "ShoreditchBar") do |post_content|
  post_content.caption = 'メキシコ料理好きな方にオススメ！'
  post_content.user = lucas
end

post_content = PostContent.find_by(title: "ShoreditchBar")
PostComment.create! do |post_comment|
  post_comment.post_content = post_content
  post_comment.user = james
  post_comment.comment = "ここにコメントを記入"
end

Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') do
end

puts "seedの実行が完了しました"