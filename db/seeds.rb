Post.delete_all
Tag.delete_all
PostTags.delete_all

tags = []

tags << Tag.create!(name: "Game Recap")
tags << Tag.create!(name: "Analysis")
tags << Tag.create!(name: "Scouting Report")
tags << Tag.create!(name: "Off-Topic")


10.times do
  Post.create!(name: Faker::Lorem.sentence(word_count = 3, supplemental = false),
               body: Faker::Lorem.paragraphs(paragraph_count = 3, supplemental = false),
               author: Faker::Name.name
                )
end



