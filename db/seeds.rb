require "open-uri"

# 1. Clean the database
puts "Cleaning database..."
Message.destroy_all
Review.destroy_all
Request.destroy_all
UserSkill.destroy_all
User.destroy_all
Skill.destroy_all

# 2. Create Users and Skills 🏗️

# Hardcoded users - MAKE THIS MORE FUN LE WAGON VIBES!
# FIRST 3 can be the ones you properly show on demo day
users = [
  { email: "otto@lewagon.com", password: "123456", name: "Otto", city: "Berlin", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209109/User%20Pics%20Give/urgtwlvdafzszdan9nqr.jpg", summary: "A highly skilled full-stack developer with 5+ years of experience in web technologies. Alex excels in problem-solving and delivering robust solutions. Highly proficient in Ruby on Rails, JavaScript, and React. Passionate about clean code and efficient workflows. Alex has an eye for details and consistently meets project deadlines. An expert in debugging and optimizing complex systems." },
  { email: "oscar@lewagon.com", password: "123456", name: "Oscar", city: "Hamburg", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209110/User%20Pics%20Give/k0jzbx8sljzm06b7km4s.jpg",summary: "An experienced product manager with a strong background in agile methodologies. Bernadette focuses on user-centric designs and consistently delivers high-quality software. Known for excellent problem-solving skills, she tackles complex problems with ease. She is a go-to leader for her team, ensuring that everyone is motivated and aligned. Bernadette excels at setting priorities and driving innovation." },
  { email: "massih@lewagon.com", password: "123456", name: "Massih", city: "München", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209110/User%20Pics%20Give/c9tfn02cyivaebwtw7om.jpg", summary: "A highly experienced software engineer with a passion for building scalable web applications. Charlie specializes in JavaScript, Node.js, and Python. Known for an analytical approach to troubleshooting, he always finds optimal solutions. He is an advocate of clean, maintainable code and is always improving his skills. He thrives under pressure and is a strong team player who ensures timely delivery of projects." },
  { email: "dariusz@lewagon.com", password: "123456", name: "Dariusz", city: "Berlin", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209109/User%20Pics%20Give/xgz0gi2z6waric0s6ryc.jpg", summary: "A talented software developer with expertise in both backend and frontend development. Diana is dedicated to delivering high-performance solutions that meet client needs. She is well-versed in multiple programming languages, including Java and Ruby. Diana is a problem solver who enjoys creating innovative solutions to complex technical challenges. She has a knack for breaking down tasks and staying organized." },
  { email: "tamari@lewagon.com", password: "123456", name: "Tamari", city: "Hamburg", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209109/User%20Pics%20Give/ks3aipdrg83s5ucf2uma.jpg", summary: "An experienced software architect and team leader. Erik has a passion for designing and implementing large-scale distributed systems. He thrives on challenges and has led many successful projects from start to finish. Erik is adept at identifying inefficiencies in workflows and making process improvements. His leadership and communication skills enable him to manage cross-functional teams effectively." },
  { email: "yuta@lewagon.com", password: "123456", name: "Yuta", city: "München", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209109/User%20Pics%20Give/k105jfgdvsr1kb82ukkk.jpg", summary: "A highly creative UI/UX designer with an eye for detail. Fiona creates intuitive and engaging user interfaces that enhance the user experience. She thrives in fast-paced environments and enjoys collaborating with cross-functional teams. Her problem-solving approach involves understanding user needs and implementing effective design solutions. Fiona is always experimenting with new tools and technologies to stay ahead in the design field." },
  { email: "ahlam@lewagon.com", password: "123456", name: "Ahlam", city: "Berlin", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209109/User%20Pics%20Give/c3fus44btq1mlh26gfpm.jpg", summary: "A versatile full-stack developer with a strong command of JavaScript frameworks and backend technologies. George specializes in building web applications that scale efficiently. He has a deep understanding of performance optimization techniques. George enjoys working in agile environments and is quick to adapt to changing requirements. His logical approach to problem-solving and strong communication skills make him an excellent collaborator." },
  { email: "naakul@lewagon.com", password: "123456", name: "Naakul", city: "Hamburg", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209109/User%20Pics%20Give/u0xxfrjluonhjwvfny9h.jpg", summary: "A senior product designer with over 8 years of experience in digital product design. Helen is known for her ability to translate business needs into functional, user-friendly designs. She is skilled at collaborating with development teams to ensure seamless implementation. Her problem-solving skills are exceptional, and she often finds creative solutions to complex design challenges. Helen is passionate about creating exceptional user experiences." },
  { email: "ian@lewagon.com", password: "123456", name: "Ian", city: "München", picture_url: "https://biografieonline.it/img/bio/gallery/j/Jannik_Sinner_13.jpg", summary: "An experienced software developer with a focus on cloud computing and microservices. Ian excels in designing and developing solutions that leverage cloud technologies. He enjoys tackling complex technical challenges and delivering optimized solutions. Ian has strong communication skills, and his collaborative approach ensures project success. He is always exploring new technologies to stay at the cutting edge of software development." },
  { email: "julia@lewagon.com", password: "123456", name: "Julia", city: "Berlin", picture_url: "https://tse3.mm.bing.net/th?id=OIP._f4BrshhUe0JylihohGTjwHaJ4&pid=Api", summary: "A talented mobile app developer with experience building both iOS and Android applications. Julia is known for her attention to detail and ability to develop applications that are both functional and visually appealing. She has a deep understanding of mobile development best practices and performance optimization. Julia excels at working with teams to deliver apps on time, and she is constantly improving her skills." }
]


# Create user records
users.each do |user_data|
  user = User.find_or_create_by(email: user_data[:email]) do |u|
    u.password = user_data[:password]
    u.name = user_data[:name]
    u.city = user_data[:city]
    u.summary = user_data[:summary]
    u.balance = 100
    # file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg").open
    u.picture_url = user_data[:picture_url]
    file = URI.open(user_data[:picture_url])
    u.photo.attach(io: file, filename: "user_name.png", content_type: "image/png")
    u.save
  end
  puts "Created user: #{user.name} from #{user.city}"
end





# Create skills
# skills = ['Ruby', 'JavaScript', 'Python', 'Java', 'C++', 'SQL', 'HTML', 'CSS', 'React', 'Rails']
# skill_objects = skills.map { |skill| Skill.find_or_create_by(name: skill) }


# 2. Define skill categories with relevant skills
skills = [
  'Python', 'JavaScript', 'Ruby', 'C++', 'Java', 'SQL', 'HTML', 'CSS', 'React', 'Node.js',
  'Yoga', 'Table Tennis', 'Tennis', 'Swimming', 'Running', 'Weightlifting', 'Cycling', 'Climbing', 'Boxing', 'Pilates',
  'Painting', 'Sketching', 'Sculpting', 'Calligraphy', 'Photography', 'Digital Art', 'Graphic Design', 'Illustration', 'Watercoloring', 'Tattoo Design',
  'Making Chutney', 'Cooking Indian Curries', 'Baking Bread', 'Fermenting Foods', 'Making Pasta from Scratch', 'Barista Skills', 'Knife Skills', 'Food Plating', 'Meal Prep', 'Wine Pairing',
  'Contract Law Basics', 'Tax Optimization', 'Company Formation', 'Freelance Legal Rights', 'Employment Law', 'Consumer Protection Laws', 'Real Estate Law', 'Negotiation Skills', 'Intellectual Property Basics', 'Investment Law',
  'Plumbing Basics', 'Carpentry', 'Electrical Wiring', 'Drywall Repair', 'Furniture Restoration', 'Tiling & Grouting', 'Painting Walls', 'Fixing Leaks', 'Installing Smart Home Devices', 'Sewing & Fabric Repair',
  'Leadership Coaching', 'Career Coaching', 'Public Speaking', 'Time Management', 'Stress Management', 'Confidence Building', 'Life Coaching', 'Negotiation Tactics', 'Goal Setting', 'Mindfulness & Meditation',
  'Fixing Flat Tires', 'Adjusting Brakes', 'Tuning a Bicycle Gear', 'Changing Car Oil', 'Replacing Brake Pads', 'Car Engine Diagnostics', 'Basic Car Repairs', 'Motorcycle Maintenance', 'Electric Scooter Repair', 'Building a Custom Bike',
  'SEO Basics', 'Social Media Marketing', 'Content Writing', 'Graphic Design for Ads', 'Brand Building', 'Personal Branding', 'Video Editing', 'Copywriting', 'Market Research', 'Running Google Ads',
  'English Fluency', 'German for Beginners', 'Spanish Conversation', 'French Pronunciation', 'Chinese Writing', 'Public Speaking', 'Storytelling', 'Interview Preparation', 'Business Email Writing', 'Negotiation in Foreign Languages'
]

skill_objects = skills.map { |skill| Skill.find_or_create_by(name: skill) }

puts "Skills created."

# # Create Ruby skill
ruby_skill = Skill.find_or_create_by(name: "Ruby")

# Assign Ruby skill to 5 users without duplication
ruby_users = User.where.not(email: "nakul@lewagon.com").limit(5)
ruby_users.each do |user|
  unless UserSkill.exists?(user: user, skill: ruby_skill)
    UserSkill.create!(user: user, skill: ruby_skill, experience: 'Advanced', overall_rating: 5)
    puts "Assigned Ruby skill to #{user.name}."
  else
    puts "Skipped assigning Ruby skill to #{user.name} (already assigned)."
  end
end

# # Assign Ruby skill to 5 users
# ruby_users = User.where.not(email: "naakul@lewagon.com").limit(5)
# ruby_users.each do |user|
#   UserSkill.create!(user: user, skill: ruby_skill, experience: 'Advanced', overall_rating: 5)
#   puts "Assigned Ruby skill to #{user.name}."
# end

# 3. Assign Skills to Users through UserSkilluser_skills =
# user_skills = {
#   "alex@example.com" => [
#     { skill: "Ruby", experience: "Intermediate", overall_rating: 4 },
#     { skill: "JavaScript", experience: "Advanced", overall_rating: 5 },
#     { skill: "Python", experience: "Beginner", overall_rating: 2 }
#   ],
#   "bernadette@example.com" => [
#     { skill: "Java", experience: "Advanced", overall_rating: 5 },
#     { skill: "C++", experience: "Intermediate", overall_rating: 4 },
#     { skill: "Rails", experience: "Beginner", overall_rating: 3 }
#   ],
#   "charlie@example.com" => [
#     { skill: "HTML", experience: "Intermediate", overall_rating: 4 },
#     { skill: "CSS", experience: "Advanced", overall_rating: 5 },
#     { skill: "React", experience: "Beginner", overall_rating: 2 }
#   ],
#   "diana@example.com" => [
#     { skill: "Ruby", experience: "Advanced", overall_rating: 5 },
#     { skill: "JavaScript", experience: "Intermediate", overall_rating: 4 },
#     { skill: "React", experience: "Beginner", overall_rating: 3 }
#   ],
#   "erik@example.com" => [
#     { skill: "SQL", experience: "Advanced", overall_rating: 5 },
#     { skill: "Rails", experience: "Intermediate", overall_rating: 4 },
#     { skill: "Java", experience: "Beginner", overall_rating: 2 }
#   ],
#   "fiona@example.com" => [
#     { skill: "JavaScript", experience: "Intermediate", overall_rating: 4 },
#     { skill: "Python", experience: "Advanced", overall_rating: 5 },
#     { skill: "React", experience: "Beginner", overall_rating: 2 }
#   ],
#   "george@example.com" => [
#     { skill: "C++", experience: "Advanced", overall_rating: 5 },
#     { skill: "SQL", experience: "Intermediate", overall_rating: 4 },
#     { skill: "Ruby", experience: "Beginner", overall_rating: 3 }
#   ],
#   "helen@example.com" => [
#     { skill: "Python", experience: "Intermediate", overall_rating: 4 },
#     { skill: "Java", experience: "Advanced", overall_rating: 5 },
#     { skill: "React", experience: "Beginner", overall_rating: 2 }
#   ],
#   "ian@example.com" => [
#     { skill: "HTML", experience: "Beginner", overall_rating: 3 },
#     { skill: "CSS", experience: "Intermediate", overall_rating: 4 },
#     { skill: "Rails", experience: "Advanced", overall_rating: 5 }
#   ],
#   "julia@example.com" => [
#     { skill: "Java", experience: "Advanced", overall_rating: 5 },
#     { skill: "Ruby", experience: "Intermediate", overall_rating: 4 },
#     { skill: "Rails", experience: "Beginner", overall_rating: 2 }
#   ]
# }


# user_skills.each do |email, skills|
#   user = User.find_by(email: email)  # Find the user by email
#   skills.each do |skill_data|
#     skill = Skill.find_by(name: skill_data[:skill])  # Find the skill by name
#     # Ensure the skill and user exist before creating the UserSkill
#     if user && skill
#       UserSkill.find_or_create_by(user: user, skill: skill) do |us|
#         us.experience = skill_data[:experience]
#         us.overall_rating = skill_data[:overall_rating]
#       end
#       puts "Assigned skill #{skill.name} to #{user.email}."
#     else
#       puts "Error: User or Skill not found for #{email} - #{skill_data[:skill]}"
#     end
#   end
# end

User.where.not(email: "naakul@lewagon.com").each do |user|
  user_experience = ["Beginner", "Intermidiate", "Advanced"]
  rand(3..5).times do
    UserSkill.create(
      user: user,
      skill: Skill.all.sample,
      experience: user_experience.sample,
      overall_rating: rand(2..5)
    )
  end
end

naakul = User.find_by(email: "naakul@lewagon.com")
skills = ['Ruby', 'JavaScript', 'AI Development', 'System Architecture', 'Mentorship']
skill_objects = skills.map { |skill| Skill.find_or_create_by(name: skill) }

skill_objects.each do |skill|
  UserSkill.create(user: naakul, skill: skill, experience: 'Advanced', overall_rating: 5)
end
puts "Assigned skills to Naakul."

# Create 1 Requests for Naakul's skills
naakul.user_skills.each do |user_skill|
  5.times do
    request = Request.create!(user_id: User.all.sample.id, user_skill_id: user_skill.id, completed: true)
    puts "Created request for Naakul's skill: #{user_skill.skill.name}"
  end
end

# Create 5 Reviews for Naakul
completed_requests = Request.where(user_skill: naakul.user_skills, completed: true).limit(5)
review_contents = [
  "Naakul provided excellent insights and guidance!",
  "Fantastic experience working with Naakul, highly recommended.",
  "Great mentor and software architect, really helped streamline my project!",
  "Superb AI knowledge, helped me refine my algorithm efficiently.",
  "One of the best experiences collaborating with Naakul!"
]

completed_requests.each_with_index do |request, index|
  Review.create!(
    request: request,
    rating: 5,
    content: review_contents[index],
    title: "Review for #{request.user_skill.skill.name} service"
  )
  puts "Created review for request ##{request.id} (Skill: #{request.user_skill.skill.name})"
end



# 4. Hardcode Requests
# requests = []
# 10.times do
#   user_id = User.all.sample.id  # Get a random user
#   user_skill_id = UserSkill.where(user_id: user_id).sample.id  # Get a random user_skill associated with the random user
#   completed = [true, false].sample  # Randomly assign whether the request is completed or not

#   requests << { user_id: user_id, user_skill_id: user_skill_id, completed: completed }
# end

# # Now create requests in the database
# requests.each do |request_data|
#   Request.create!(user_id: request_data[:user_id], user_skill_id: request_data[:user_skill_id], completed: request_data[:completed])
#   puts "Created request for user ##{request_data[:user_id]} with skill ##{request_data[:user_skill_id]} completed: #{request_data[:completed]}"
# end


# instead, lets create 3-5 requests per user skill
# during request creation, we make some reviews

UserSkill.all.each do |user_skill|
  rand(3..5).times do
    request_data = {
      # user making the request (taker):
      user_id: User.all.sample.id,
      # giver:
      user_skill_id: user_skill.id,
      completed: [true, true, false].sample
    }
    puts "creating request..."
    Request.create!(user_id: request_data[:user_id], user_skill_id: request_data[:user_skill_id], completed: request_data[:completed])
    puts "Created request for user ##{request_data[:user_id]} with skill ##{request_data[:user_skill_id]} completed: #{request_data[:completed]}"
  end
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
# review_records = []
# 10.times do
#   request = Request.all.sample  # Randomly select a request
#   rating = rand(1..5)  # Randomly select a

# rating between 1 and 5
#   content = review_contents.sample  # Randomly select content from predefined list
#   user = request.user
#   review_records << { request_id: request, rating: rating, content: content, title: "Review for request ##{request.id}", user_id: user }
# end

# # Now create reviews in the database
# review_records.each do |review_data|
#   Review.create!(request: review_data[:request_id], rating: review_data[:rating], content: review_data[:content], title: review_data[:title])
#   puts "Created review for request ##{review_data[:request_id]} with rating #{review_data[:rating]}"
# end

# iterate over all Requests - if completed, then create a review

Request.all.each do |request|
  if request.completed && request.user_skill.user.email != "naakul@lewagon.com"
    review_data = {
      title: "Review for #{request.user_skill.skill.name} service",
      content: review_contents.sample,
      rating: rand(1..5),
      request_id: request
    }
    puts "creating review..."
    Review.create!(request: review_data[:request_id], rating: review_data[:rating], content: review_data[:content], title: review_data[:title])
    puts "Created review for request ##{review_data[:request_id]} with rating #{review_data[:rating]}"
  end
end

# request_id: review_data[:request_id],




# FOR SPECIFIC USERS FOR DEMO DAY, OVERWIRTE THE USER SKILL FOR THE USERS YOU WANT TO SHOW AND CHAT ITH IN DEMO!
# User.all.first(3).each do .... (change the user skill)


# for demo day, eg using kat as main character
# kat = User.fid_by(name: "Kat")
# remove any current user skills and their requests and reviews (beware of depenency!!)
# create relevant user skills for the story
# for each new user skill, create 3-5 requets, and for each request, if complete, write a review
