#!/usr/bin/env ruby

user = User.where(id: 1).first
user.password = 'test1234'
user.password_confirmation = 'test1234'
user.save!