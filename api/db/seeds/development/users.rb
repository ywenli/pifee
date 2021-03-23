10.times do |n|
  url = "user#{n}_url"
  name = "user#{n}"
  email = "#{name}@example.com"
  profile = "#{name}のプロフィール"
  user = User.find_or_initialize_by(url: url, name: name, email: email, activated: true)

  if user.new_record?
    user.password = "password"
    user.save!
  end
end

puts "users = #{User.count}"
