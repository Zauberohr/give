# 1. Clean the database
puts "Cleaning database..."
Message.destroy_all
Review.destroy_all
Request.destroy_all
UserSkill.destroy_all
User.destroy_all
Skill.destroy_all



# 2. Create Users and Skills 🏗️

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
  User.find_or_create_by(email: user_data[:email]) do |u|
    u.password = user_data[:password]
  end
end

created_users.each do |user|
  puts "User created: #{user.email} with skills: #{user.skills.map { |s| s.name }.join(', ')}"
end

# Create skills
skills = ['Ruby', 'JavaScript', 'Python', 'Java', 'C++', 'SQL', 'HTML', 'CSS', 'React', 'Rails']
skill_objects = skills.map { |skill| Skill.find_or_create_by(name: skill) }

# 3. Assign Skills to Users through UserSkill

user_skills = {
  "alex@example.com" => [
    { skill: "Ruby", experience: "Intermediate", overall_rating: 4 },
    { skill: "JavaScript", experience: "Advanced", overall_rating: 5 },
    { skill: "Python", experience: "Beginner", overall_rating: 2 }
  ],
  "bernadette@example.com" => [
    { skill: "Java", experience: "Advanced", overall_rating: 5 },
    { skill: "C++", experience: "Intermediate", overall_rating: 4 },
    { skill: "Rails", experience: "Beginner", overall_rating: 3 }
  ],
  "charlie@example.com" => [
    { skill: "HTML", experience: "Intermediate", overall_rating: 4 },
    { skill: "CSS", experience: "Advanced", overall_rating: 5 },
    { skill: "React", experience: "Beginner", overall_rating: 2 }
  ],
  "diana@example.com" => [
    { skill: "Ruby", experience: "Advanced", overall_rating: 5 },
    { skill: "JavaScript", experience: "Intermediate", overall_rating: 4 },
    { skill: "React", experience: "Beginner", overall_rating: 3 }
  ],
  "erik@example.com" => [
    { skill: "SQL", experience: "Advanced", overall_rating: 5 },
    { skill: "Rails", experience: "Intermediate", overall_rating: 4 },
    { skill: "Java", experience: "Beginner", overall_rating: 2 }
  ],
  "fiona@example.com" => [
    { skill: "JavaScript", experience: "Intermediate", overall_rating: 4 },
    { skill: "Python", experience: "Advanced", overall_rating: 5 },
    { skill: "React", experience: "Beginner", overall_rating: 2 }
  ],
  "george@example.com" => [
    { skill: "C++", experience: "Advanced", overall_rating: 5 },
    { skill: "SQL", experience: "Intermediate", overall_rating: 4 },
    { skill: "Ruby", experience: "Beginner", overall_rating: 3 }
  ],
  "helen@example.com" => [
    { skill: "Python", experience: "Intermediate", overall_rating: 4 },
    { skill: "Java", experience: "Advanced", overall_rating: 5 },
    { skill: "React", experience: "Beginner", overall_rating: 2 }
  ],
  "ian@example.com" => [
    { skill: "HTML", experience: "Beginner", overall_rating: 3 },
    { skill: "CSS", experience: "Intermediate", overall_rating: 4 },
    { skill: "Rails", experience: "Advanced", overall_rating: 5 }
  ],
  "julia@example.com" => [
    { skill: "Java", experience: "Advanced", overall_rating: 5 },
    { skill: "Ruby", experience: "Intermediate", overall_rating: 4 },
    { skill: "Rails", experience: "Beginner", overall_rating: 2 }
  ]
}


user_skills.each do |email, skills|
  user = User.find_by(email: email)  # Find the user by email
  skills.each do |skill_data|
    skill = Skill.find_by(name: skill_data[:skill])  # Find the skill by name
    # Ensure the skill and user exist before creating the UserSkill
    if user && skill
      UserSkill.find_or_create_by(user: user, skill: skill) do |us|
        us.experience = skill_data[:experience]
        us.overall_rating = skill_data[:overall_rating]
      end
      puts "Assigned skill #{skill.name} to #{user.email}."
    else
      puts "Error: User or Skill not found for #{email} - #{skill_data[:skill]}"
    end
  end
end

# 4. Hardcode Requests
requests = []
10.times do
  user_id = User.all.sample.id  # Get a random user
  user_skill_id = UserSkill.where(user_id: user_id).sample.id  # Get a random user_skill associated with the random user
  completed = [true, false].sample  # Randomly assign whether the request is completed or not

  requests << { user_id: user_id, user_skill_id: user_skill_id, completed: completed }
end

# Now create requests in the database
requests.each do |request_data|
  Request.create!(user_id: request_data[:user_id], user_skill_id: request_data[:user_skill_id], completed: request_data[:completed])
  puts "Created request for user ##{request_data[:user_id]} with skill ##{request_data[:user_skill_id]} completed: #{request_data[:completed]}"
end

# 5. Dynamically Create Messages with Random User and Request Associations
messages = [
  "Hi, I'm working on a project and need help with some tasks. Could you assist?",
  "Hey, I'm stuck with some code and could use some help. Would you mind lending a hand?",
  "Hi there, I'm facing issues with the current implementation. Can you offer some guidance?",
  "Hey, I'm working on a task and could use your expertise. Can you help?",
  "Hi, I'm working on a project but need some assistance with debugging. Can you help me out?",
  "Hey, I’m struggling with some aspects of the code. Could you provide some insight?",
  "Hi, I could use some help with some features I’m working on. Could you take a look?",
  "Hey, I need your help with some tasks. Would you mind helping me out?",
  "Hi, I need assistance with a feature. Could you lend a hand?",
  "Hey, I’m stuck on a problem. Could you offer your expertise?"
]

# Dynamically assign user_id and request_id for messages
message_records = []
10.times do
  user_id = User.all.sample.id  # Randomly select a user
  request_id = Request.all.sample.id  # Randomly select a request
  content = messages.sample  # Randomly select content from predefined list

  message_records << { user_id: user_id, request_id: request_id, content: content }
end

# Now create the messages in the database
message_records.each do |message_data|
  Message.create!(user_id: message_data[:user_id], request_id: message_data[:request_id], content: message_data[:content])
  puts "Created message for user ##{message_data[:user_id]} on request ##{message_data[:request_id]}"
end


# 6. Hardcode Reviews
review_contents = [
  "Excellent work on the task, very quick and thorough!",
  "Solid progress, looking forward to the final result.",
  "The task was done well, but some improvements are needed in certain areas.",
  "Great job! The work was flawless, and the structure was clean.",
  "Handled the task well, but there are minor areas for improvement.",
  "Good effort, but there are still some issues that need fixing.",
  "Outstanding work! Exceeded my expectations.",
  "Solid work overall, but a bit more time could have been spent on the CSS.",
  "Very good work, almost perfect. A few minor issues, but still great!",
  "Amazing work, couldn't ask for anything better."
]

# Dynamically assign request_id, rating, and content for reviews
review_records = []
10.times do
  request_id = Request.all.sample.id  # Randomly select a request
  rating = rand(1..5)  # Randomly select a rating between 1 and 5
  content = review_contents.sample  # Randomly select content from predefined list

  review_records << { request_id: request_id, rating: rating, content: content, title: "Review for request ##{request_id}" }
end

# Now create reviews in the database
review_records.each do |review_data|
  Review.create!(request_id: review_data[:request_id], rating: review_data[:rating], content: review_data[:content], title: review_data[:title])
  puts "Created review for request ##{review_data[:request_id]} with rating #{review_data[:rating]}"
end
