require 'rubygems'
require 'bundler'
Bundler.require(:default)

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :password, BCryptHash
end

DataMapper.setup(:default, "sqlite::memory:")
DataMapper.auto_migrate!

user = User.new :name => 'chris', :password => 'password'

puts "Password stored in database: #{user.password}"

if user.password == 'password'
  puts "Logged in!"
else
  puts "Something went wrong."
end
