# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def generate_user(num)
	num.times do 
		username = Faker::Internet.user_name
		email = Faker::Internet.email
		pw = ('a'..'z').to_a.sample(5)+Array.new(5){rand(0..9)}
		pw = pw.shuffle.join

		User.create(username: username, email: email, password_hash: pw)
	end
end

def generate_post(num)
	num.times do
		title = Faker::Company.bs
		body = Faker::Lorem.paragraph(rand(4..10))
		user = User.all.sample
		Article.create(title: title, body: body, user_id: user.id)
	end
end


generate_post(100)