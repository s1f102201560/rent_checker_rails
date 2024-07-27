users_lst = []

10.times do |i|
  name = "user#{i + 1}"
  email = "#{name}@example.com"
  users_lst << { name: name, email: email }
end

User.create!(users_lst)
