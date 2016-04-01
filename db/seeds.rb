# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData

# Create topics
  15.times do
    Topic.create!(
      name:         RandomData.random_sentence,
      description:  RandomData.random_paragraph
    )
  end
  topics = Topic.all


# Create posts
  50.times do

    Post.create!(
      topic: topics.sample,
      title: RandomData.random_sentence,
      body:  RandomData.random_paragraph
    )
  end
  posts = Post.all

  #Create comments

  100.times do
    Comment.create!(

      post: posts.sample,
      body:  RandomData.random_paragraph
    )
  end

# Create Sponsored Posts

  30.times do
    SponsoredPost.create!(
      topic: topics.sample,
      title: RandomData.random_sentence,
      body:  RandomData.random_paragraph,
      price: 100
    )
  end

sponsored_posts = SponsoredPost.all

puts "Seed finished"
puts "#{Topic.count} topics created."
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."
puts "#{SponsoredPost.count} sponsored posts created."
