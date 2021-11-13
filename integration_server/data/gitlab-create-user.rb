#!/usr/bin/env ruby

user = User.new()
user.email = "test@test.com"
user.name = "Test Test"
user.username = "test"
user.password = "test1234"
user.password_confirmation = "test1234"
user.skip_confirmation!
user.save!

token = PersonalAccessToken.new
token.user_id = User.find_by(username: 'test').id
token.name = 'default'
token.scopes = ["api"]
token.set_token('ypCa3Dzb23o5nvsixwPP')
token.save!
