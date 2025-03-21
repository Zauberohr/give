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
  { email: "massih@lewagon.com", password: "123456", name: "Massih", city: "Berlin", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209110/User%20Pics%20Give/c9tfn02cyivaebwtw7om.jpg", summary: "A highly experienced software engineer with a passion for building scalable web applications. Charlie specializes in JavaScript, Node.js, and Python. Known for an analytical approach to troubleshooting, he always finds optimal solutions. He is an advocate of clean, maintainable code and is always improving his skills. He thrives under pressure and is a strong team player who ensures timely delivery of projects." },
  { email: "dariusz@lewagon.com", password: "123456", name: "Darek", city: "München", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209109/User%20Pics%20Give/xgz0gi2z6waric0s6ryc.jpg", summary: "A talented software developer with expertise in both backend and frontend development. Diana is dedicated to delivering high-performance solutions that meet client needs. She is well-versed in multiple programming languages, including Java and Ruby. Diana is a problem solver who enjoys creating innovative solutions to complex technical challenges. She has a knack for breaking down tasks and staying organized." },
  { email: "tamari@lewagon.com", password: "123456", name: "Tamari", city: "Hamburg", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209109/User%20Pics%20Give/ks3aipdrg83s5ucf2uma.jpg", summary: "An experienced software architect and team leader. Erik has a passion for designing and implementing large-scale distributed systems. He thrives on challenges and has led many successful projects from start to finish. Erik is adept at identifying inefficiencies in workflows and making process improvements. His leadership and communication skills enable him to manage cross-functional teams effectively." },
  { email: "yuta@lewagon.com", password: "123456", name: "Yuta", city: "Düsseldorf", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209109/User%20Pics%20Give/k105jfgdvsr1kb82ukkk.jpg", summary: "A highly creative UI/UX designer with an eye for detail. Fiona creates intuitive and engaging user interfaces that enhance the user experience. She thrives in fast-paced environments and enjoys collaborating with cross-functional teams. Her problem-solving approach involves understanding user needs and implementing effective design solutions. Fiona is always experimenting with new tools and technologies to stay ahead in the design field." },
  { email: "ahlam@lewagon.com", password: "123456", name: "Ahlam", city: "Berlin", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209109/User%20Pics%20Give/c3fus44btq1mlh26gfpm.jpg", summary: "A versatile full-stack developer with a strong command of JavaScript frameworks and backend technologies. George specializes in building web applications that scale efficiently. He has a deep understanding of performance optimization techniques. George enjoys working in agile environments and is quick to adapt to changing requirements. His logical approach to problem-solving and strong communication skills make him an excellent collaborator." },
  { email: "naakul@lewagon.com", password: "123456", name: "Nakul", city: "Berlin", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742209109/User%20Pics%20Give/u0xxfrjluonhjwvfny9h.jpg", summary: "A highly skilled plumber with years of hands-on experience in fixing leaks, pipe installations, and home maintenance. Naakul is known for his ability to quickly diagnose plumbing issues and provide efficient, long-lasting solutions. He is detail-oriented, ensuring that every repair is done to perfection. His problem-solving skills are exceptional, and he often finds creative fixes for even the trickiest plumbing challenges. Naakul is passionate about helping others and making sure every home or office stays dry and disaster-free." },
  { email: "ian@lewagon.com", password: "123456", name: "Ian", city: "München", picture_url: "https://biografieonline.it/img/bio/gallery/j/Jannik_Sinner_13.jpg", summary: "An experienced software developer with a focus on cloud computing and microservices. Ian excels in designing and developing solutions that leverage cloud technologies. He enjoys tackling complex technical challenges and delivering optimized solutions. Ian has strong communication skills, and his collaborative approach ensures project success. He is always exploring new technologies to stay at the cutting edge of software development." },
  { email: "julia@lewagon.com", password: "123456", name: "Julia", city: "Köln", picture_url: "https://tse3.mm.bing.net/th?id=OIP._f4BrshhUe0JylihohGTjwHaJ4&pid=Api", summary: "A talented mobile app developer with experience building both iOS and Android applications. Julia is known for her attention to detail and ability to develop applications that are both functional and visually appealing. She has a deep understanding of mobile development best practices and performance optimization. Julia excels at working with teams to deliver apps on time, and she is constantly improving her skills." },
  { email: "bilal@lewagon.com", password: "123456", name: "Bilal", city: "Berlin", picture_url: "https://res.cloudinary.com/djufjbe6h/image/upload/v1742395907/Bilal_buhmrb.png", summary: "Bilal is a highly skilled automation specialist with deep expertise in AI modeling for Bitcoin trading. With years of experience in developing cutting-edge algorithms, he has mastered the art of creating AI-driven systems that analyze market trends, optimize trades, and maximize profits. His AI models are designed to make trading more efficient, reducing risks while increasing potential gains. Known for his innovative thinking and precision, Bilal has helped many individuals and businesses automate their cryptocurrency strategies, turning complex data into smart financial decisions. If you're looking for a way to scale your trading game using AI, Bilal is the go-to expert!" }
]



# Create user records
users.each do |user_data|
  user = User.find_or_create_by(email: user_data[:email]) do |u|
    u.password = user_data[:password]
    u.name = user_data[:name]
    u.city = user_data[:city]
    u.summary = user_data[:summary]
    u.balance = 100
    u.picture_url = user_data[:picture_url]
    file = URI.open(user_data[:picture_url])
    u.photo.attach(io: file, filename: "user_name.png", content_type: "image/png")
    u.save
  end
  puts "Created user: #{user.name} from #{user.city}"
end


# 2. Define skill categories with relevant skills
skills = [
  'AI Modeling', 'Bitcoin Trading Automation', 'Machine Learning for Finance', 'Algorithmic Trading', 'Cryptocurrency Market Analysis', 'SQL', 'HTML', 'CSS', 'React', 'Node.js',
  'Yoga', 'Table Tennis', 'Tennis', 'Swimming', 'Running', 'Weightlifting', 'Cycling', 'Climbing', 'Boxing', 'Pilates',
  'Painting', 'Sketching', 'Sculpting', 'Calligraphy', 'Photography', 'Digital Art', 'Graphic Design', 'Illustration', 'Watercoloring', 'Tattoo Design',
  'Making Chutney', 'Cooking', 'Baking Bread', 'Fermenting Foods', 'Making Pasta from Scratch', 'Barista Skills', 'Knife Skills', 'Food Plating', 'Meal Prep', 'Wine Pairing',
  'Contract Law Basics', 'Tax Optimization', 'Company Formation', 'Freelance Legal Rights', 'Employment Law', 'Consumer Protection Laws', 'Real Estate Law', 'Negotiation Skills', 'Intellectual Property Basics', 'Investment Law',
  'Plumbing', 'Carpentry', 'Electrical Wiring', 'Drywall Repair', 'Furniture Restoration', 'Tiling & Grouting', 'Painting Walls', 'Fixing Leaks', 'Installing Smart Home Devices', 'Sewing & Fabric Repair',
  'Leadership Coaching', 'Career Coaching', 'Public Speaking', 'Time Management', 'Stress Management', 'Confidence Building', 'Life Coaching', 'Negotiation Tactics', 'Goal Setting', 'Mindfulness & Meditation',
  'Fixing Flat Tires', 'Adjusting Brakes', 'Tuning a bike', 'Changing Car Oil', 'Replacing Brake Pads', 'Car Engine Diagnostics', 'Basic Car Repairs', 'Motorcycle Maintenance', 'Electric Scooter Repair', 'Building a Custom Bike',
  'SEO Basics', 'Social Media Marketing', 'Content Writing', 'Graphic Design for Ads', 'Brand Building', 'Personal Branding', 'Video Editing', 'Copywriting', 'Market Research', 'Running Google Ads',
  'English Fluency', 'German for Beginners', 'Spanish Conversation', 'French Pronunciation', 'Chinese Writing', 'Public Speaking', 'Storytelling', 'Interview Preparation', 'Email Writing',
]

skill_objects = skills.map { |skill| Skill.find_or_create_by(name: skill) }

puts "Skills created."

# # Create Ruby skill
# ruby_skill = Skill.find_or_create_by(name: "Ruby")
plumbing_skill = Skill.find_or_create_by(name: "Plumbing")

# Assign Ruby skill to 5 users without duplication
excluded_emails = ["naakul@lewagon.com", "otto@lewagon.com", "massih@lewagon.com", "ahlam@lewagon.com", "bilal@lewagon.com"]
plumbing_users = User.where.not(email: excluded_emails).limit(5) # Adjusted limit to 5
plumbing_users.each do |user|
  unless UserSkill.exists?(user: user, skill: plumbing_skill)
    UserSkill.create!(user: user, skill: plumbing_skill, experience: 'Advanced', overall_rating: 5)
    puts "Assigned Plumbing skill to #{user.name}."
  else
    puts "Skipped assigning Ruby skill to #{user.name} (already assigned)."
  end
end


excluded_emails = ["naakul@lewagon.com", "otto@lewagon.com", "massih@lewagon.com", "ahlam@lewagon.com", "bilal@lewagon.com"]
User.where.not(email: excluded_emails).each do |user|
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
skills = ['Plumbing', 'Fixing Leaks', 'Installing Smart Home Devices', 'Carpentry', 'Electrical Wiring',]
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
  "Naakul provided excellent insights and guidance! A true lifesaver—he fixed our plumbing disaster in no time and even taught us a few pro tips. Highly recommended",
  "Fantastic experience working with Naakul, highly recommended. Knows exactly what he's doing!",
  "One of the best experiences collaborating with Naakul—professional, efficient, and saved us from a flood!",
  "Great mentor! He not only fixed the problem but explained everything so well that we might not break it again.",
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


  # Bilal START
  bilal = User.find_by(email: "bilal@lewagon.com")
  skills = ['AI Modeling', 'Bitcoin Trading Automation', 'Machine Learning for Finance', 'Algorithmic Trading', 'Cryptocurrency Market Analysis']
  skill_objects = skills.map { |skill| Skill.find_or_create_by(name: skill) }

  skill_objects.each do |skill|
    UserSkill.create(user: bilal, skill: skill, experience: 'Expert', overall_rating: 5)
  end
  puts "Assigned skills to Bilal."

# Create 1 Request for Bilal's skills
  bilal.user_skills.each do |user_skill|
    5.times do
      request = Request.create!(user_id: User.all.sample.id, user_skill_id: user_skill.id, completed: true)
      puts "Created request for Bilal's skill: #{user_skill.skill.name}"
    end
  end

# Create 5 Reviews for Bilal
  completed_requests = Request.where(user_skill: bilal.user_skills, completed: true).limit(5)
  review_contents = [
    "Bilal's AI model completely transformed my Bitcoin trading strategy—my profits have skyrocketed! Highly recommended!",
    "Fantastic experience working with Bilal, his AI insights are next-level. He automated my trades with incredible precision!",
    "One of the best AI experts in the game! His trading algorithms are top-notch and work flawlessly.",
    "Bilal’s AI automation saved me hours of manual trading. Now my portfolio is growing on autopilot!",
    "Highly skilled AI modeler—Bilal’s strategies helped me scale my crypto investments efficiently!"
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
  # BILAL ENDE








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
