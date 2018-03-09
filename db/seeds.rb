# frozen_string_literal: false
# coding: utf-8

# @user = User.new
# @user.name = "Hiro Nishide"
# @user.username = "hirooo"
# @user.location = "Kyoto, Japan"
# @user.about = "Hello, I am Hiro. From database!"
# @user.save
#
# @user = User.new
# @user.name = "Takahiro Aoki"
# @user.username = "hanryu"
# @user.location = "Tokyo, Japan"
# @user.about = "Nice to meet you!! I\'m from database!"
# @user.save
100.times do |count|
  Tweet.create(title: "タイトル #{ count }", content: "コメント #{ count }")
end
