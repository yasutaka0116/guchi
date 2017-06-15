# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ユーザー
#   user = User.new(email: 'test1@test.com', password: 'password1',password_confirmation: 'password1', name: "ユーザー1", gender: "男",age: 20, introduction: "テストテストテストテストテスト1")
#   user.save!
#   user = User.new(email: 'test2@test.com', password: 'password2',password_confirmation: 'password2', name: "ユーザー2", gender: "女",age: 21, introduction: "テストテストテストテストテスト2")
#   user.save!
#     user = User.new(email: 'test3@test.com', password: 'password3',password_confirmation: 'password3', name: "ユーザー3", gender: "女",age: 22, introduction: "テストテストテストテストテスト3")
#   user.save!
#     user = User.new(email: 'test4@test.com', password: 'password4',password_confirmation: 'password4', name: "ユーザー4", gender: "女",age: 23, introduction: "テストテストテストテストテスト4")
#   user.save!
#     user = User.new(email: 'test5@test.com', password: 'password5',password_confirmation: 'password5', name: "ユーザー5", gender: "女",age: 25, introduction: "テストテストテストテストテスト5")
#   user.save!
#     user = User.new(email: 'test6@test.com', password: 'password6',password_confirmation: 'password6', name: "ユーザー6", gender: "女",age: 24, introduction: "テストテストテストテストテスト6")
#   user.save!
#       user = User.new(email: 'test7@test.com', password: 'password7',password_confirmation: 'password7', name: "ユーザー7", gender: "女",age: 26, introduction: "テストテストテストテストテスト7")
#   user.save!
#       user = User.new(email: 'test8@test.com', password: 'password8',password_confirmation: 'password8', name: "ユーザー8", gender: "男",age: 27, introduction: "テストテストテストテストテスト8")
#   user.save!
#       user = User.new(email: 'test9@test.com', password: 'password9',password_confirmation: 'password9', name: "ユーザー9", gender: "男",age: 28, introduction: "テストテストテストテストテスト9")
#   user.save!
#      user = User.new(email: 'test10@test.com', password: 'password10',password_confirmation: 'password10', name: "ユーザー10", gender: "男",age: 29, introduction: "テストテストテストテストテスト10")
#   user.save!




# リクエスト

10.times do |i|
  if i < 4
  request = Request.new(user_id: i+1, state: "東京", address: "〒105-0011 東京都港区芝公園４丁目２−８", starttime: 4, endtime: 8, message: 'テストテストテストテストテストテスト#{i}',date: Date.today+eval("#{i}.days"), role: 0)
  request.save!
  else
  request = Request.create(user_id: i+1,state: "埼玉", address: "〒359-1145 埼玉県所沢市山口244-14", starttime: 3, endtime: 9, message: 'テストテストテストテストテストテスト#{i}',date: Date.today+eval("#{i}.days"), role: 1)
  request.save!
  end
end

# 10.times do |i|
#   accept = Accept.create(user_id: 2, request_id: 1, flag: 0, message: "テストテストテストテスト")
#   accept.save!
# end

# ルーム
# for i in 1..10 do
#   accept = Room.create(user_one_id: 11, user_two_id: i)
#   accept.save!
# end
