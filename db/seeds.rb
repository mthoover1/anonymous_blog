Post.delete_all
Tag.delete_all
PostTag.delete_all

tags = []

tags << Tag.create!(name: "Game Recap")
tags << Tag.create!(name: "Analysis")
tags << Tag.create!(name: "Scouting Report")
tags << Tag.create!(name: "Off-Topic")

users = []
count = 1

5.times do 
  users << User.create!(name: Faker::Name.name,
                         email: count,
                         password: "123" )
  count += 1
end


20.times do
  Post.create!(name: Faker::Lorem.sentence(word_count = 3, supplemental = false),
               body: Faker::Lorem.paragraphs(paragraph_count = 3, supplemental = false),
               user_id: users.sample.id
                )
end


post_ids = []
tag_ids = []

posts = Post.all
tags = Tag.all

posts.each do |post|
  post_ids << post.id
end

tags.each do |tag|
  tag_ids << tag.id
end


10.times do
  PostTag.create!(post_id: post_ids.sample,
                   tag_id: tag_ids.sample    )
end
