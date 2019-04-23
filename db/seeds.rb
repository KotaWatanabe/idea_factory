# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "supersecret"
Review.destroy_all
User.destroy_all
Idea.destroy_all
Like.destroy_all

10.times do
    name = Faker::Name.first_name
    User.create(
      name: name,
      email: "#{name.downcase}.@example.com",
      password: PASSWORD
    )
  end
  
  users = User.all

50.times do
    created_at = Faker::Date.backward(365 * 5)
    i = Idea.create(
      title: Faker::Hacker.say_something_smart,
      description: Faker::ChuckNorris.fact,
      created_at: created_at,
      updated_at: created_at,
      user: users.sample
    )
    if i.valid?
      i.reviews = rand(0..15).times.map do
        Review.new(description: Faker::GreekPhilosophers.quote, user: users.sample)
      end

      i.likers = users.shuffle.slice(0, rand(users.count))
    end
  end

ideas = Idea.all
reviews = Review.all
users = User.all

puts Cowsay.say("Generated #{ ideas.count } ideas", :ghostbusters)
puts Cowsay.say("Generated #{ reviews.count } reviews", :stegosaurus)
puts Cowsay.say("Generated #{ users.count } users", :beavis)