# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "这个种子自动建立一个2@2.com账户，并增加10个public jobs和10个hidden jobs."

create_account = User.create(email:"2@2.com", password:"123456", password_confirmation:"123456", is_admin:'true')

create_jobs = for i in 1..10 do
  Job.create(title:"job no.#{i}", description:"种子建立的第#{i}个job,public", wage_upper_bound:rand(50..99)*100, wage_lower_bound:rand(10..49)*50, is_hidden:"false")
end

create_jobs = for i in 1..10 do
  Job.create(title:"job no.#{i+10}", description:"种子建立的第#{i+10}个job,hidden", wage_upper_bound:rand(50..99)*100, wage_lower_bound:rand(10..49)*50, is_hidden:"right")
end
