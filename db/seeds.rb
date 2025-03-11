# db/seeds.rb

# 1. Clean the database 🗑️
puts "Cleaning database..."
UserSkill.destroy_all
Request.destroy_all
Message.destroy_all
Review.destroy_all
User.destroy_all
Skill.destroy_all

# 2. Create Users and Skills 🏗️
puts "Creating users and skills..."

# Hardcoded users
users = [
  { email: "alex@example.com", password: "123456" },
  { email: "bernadette@example.com", password: "123457" },
  { email: "charlie@example.com", password: "123458" },
  { email: "diana@example.com", password: "123459" },
  { email: "erik@example.com", password: "123460" },
  { email: "fiona@example.com", password: "123461" },
  { email: "george@example.com", password: "123462" },
  { email: "helen@example.com", password: "123463" },
  { email: "ian@example.com", password: "123464" },
  { email: "julia@example.com", password: "123465" }
]

# Create user records
created_users = users.map do |user_data|
  User.create!(user_data)
end
puts "Created 10 users."

# Create skills
skills = ['Ruby', 'JavaScript', 'Python', 'Java', 'C++', 'SQL', 'HTML', 'CSS', 'React', 'Rails']
skill_objects = skills.map { |skill| Skill.create!(name: skill) }
puts "Created #{skill_objects.length} skills."

# 3. Assign Skills to Users through UserSkill
puts "Assigning skills to users..."

user_skills = {
  "alex@example.com" => ["Ruby", "JavaScript", "Python"],
  "bernadette@example.com" => ["Java", "C++", "Rails"],
  "charlie@example.com" => ["HTML", "CSS", "React"],
  "diana@example.com" => ["Ruby", "JavaScript", "React"],
  "erik@example.com" => ["SQL", "Rails", "Java"],
  "fiona@example.com" => ["JavaScript", "Python", "React"],
  "george@example.com" => ["C++", "SQL", "Ruby"],
  "helen@example.com" => ["Python", "Java", "React"],
  "ian@example.com" => ["HTML", "CSS", "Rails"],
  "julia@example.com" => ["Java", "Ruby", "Rails"]
}

created_users.each do |user|
  user_skills[user.email].each do |skill_name|
    skill = skill_objects.find { |s| s.name == skill_name }
    UserSkill.create!(user: user, skill: skill, experience: "Intermediate", overall_rating: rand(1..5))
  end
  puts "Assigned 3 skills to #{user.email}"
end

# 4. Hardcode Requests
puts "Creating requests..."

requests = [
  { user_id: 1, user_skill_id: 1, completed: [true, false].sample },
  { user_id: 2, user_skill_id: 2, completed: [true, false].sample },
  { user_id: 3, user_skill_id: 3, completed: [true, false].sample },
  { user_id: 4, user_skill_id: 4, completed: [true, false].sample },
  { user_id: 5, user_skill_id: 5, completed: [true, false].sample },
  { user_id: 6, user_skill_id: 6, completed: [true, false].sample },
  { user_id: 7, user_skill_id: 7, completed: [true, false].sample },
  { user_id: 8, user_skill_id: 8, completed: [true, false].sample },
  { user_id: 9, user_skill_id: 9, completed: [true, false].sample },
  { user_id: 10, user_skill_id: 10, completed: [true, false].sample }
]

requests.each do |request_data|
  Request.create!(user_id: request_data[:user_id], user_skill_id: request_data[:user_skill_id], completed: request_data[:completed])
  puts "Created request for user ##{request_data[:user_id]} with skill ##{request_data[:user_skill_id]}"
end

# 5. Hardcode Messages
puts "Creating messages..."

messages = [
  { user_id: 1, request_id: 1, content: "Hi Bernadette, I'm working on a Ruby project and I'm stuck with some JavaScript issues. Could you help me?" },
  { user_id: 2, request_id: 2, content: "Hey Charlie, I need assistance with my Java code. I know you're good with C++ and Java, could you lend a hand?" },
  { user_id: 3, request_id: 3, content: "Diana, I’m struggling with my React project. Could you help me with some HTML and CSS fixes?" },
  { user_id: 4, request_id: 4, content: "Erik, I need help with a React component. I’m stuck, and I know you’re familiar with JavaScript. Could you help me out?" },
  { user_id: 5, request_id: 5, content: "Fiona, could you help me debug some JavaScript issues? My Python code is working but needs a React framework." },
  { user_id: 6, request_id: 6, content: "George, I’m stuck in SQL integration with my C++ project. Can you help me with the SQL queries?" },
  { user_id: 7, request_id: 7, content: "Helen, can you help me with a React component? I need to work on some Java code as well." },
  { user_id: 8, request_id: 8, content: "Ian, I’m working on a Rails project but need help with CSS. Could you lend a hand with the styling?" },
  { user_id: 9, request_id: 9, content: "Julia, I’m working on a Ruby enhancement and could use some help. Would you be willing to assist me with Rails?" },
  { user_id: 10, request_id: 10, content: "Alex, I’m fixing some Ruby code but need help with Rails. Could you check it out for me?" }
]

messages.each do |message_data|
  Message.create!(user_id: message_data[:user_id], request_id: message_data[:request_id], content: message_data[:content])
  puts "Created message for user ##{message_data[:user_id]} on request ##{message_data[:request_id]}"
end

# 6. Hardcode Reviews
puts "Creating reviews..."

reviews = [
  { request_id: 1, rating: 5, content: "Excellent work on the Ruby and JavaScript task, very quick completion!", title: "Great Job!" },
  { request_id: 2, rating: 4, content: "Solid progress on the Java task, looking forward to the final result.", title: "Good Progress" },
  { request_id: 3, rating: 3, content: "HTML/CSS fixes were good, but React integration needs improvement.", title: "Needs Improvements" },
  { request_id: 4, rating: 5, content: "React code is flawless! Really appreciated the clean structure.", title: "Excellent React" },
  { request_id: 5, rating: 4, content: "Java and SQL integration were handled well, though some parts could be optimized.", title: "Great Work!" },
  { request_id: 6, rating: 3, content: "Python logic was good, but struggled with React integration. Some help needed there.", title: "Needs Improvement" },
  { request_id: 7, rating: 5, content: "C++ performance improvements were remarkable. Great effort!", title: "Outstanding Work!" },
  { request_id: 8, rating: 4, content: "Java work was solid, but the CSS fixes took a bit longer than expected.", title: "Good Work" },
  { request_id: 9, rating: 4, content: "React code was almost perfect. A few minor issues, but overall good.", title: "Very Good" },
  { request_id: 10, rating: 5, content: "Ruby code enhancements were outstanding. Excellent work!", title: "Excellent Ruby Work" }
]

reviews.each do |review_data|
  Review.create!(request_id: review_data[:request_id], rating: review_data[:rating], content: review_data[:content], title: review_data[:title])
  puts "Created review for request ##{review_data[:request_id]}"
end

# 7. Display a message 🎉
puts "Finished! Created #{User.count} users, #{Skill.count} skills, #{UserSkill.count} user skills, #{Request.count} requests, #{Message.count} messages, and #{Review.count} reviews."
