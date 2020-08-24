# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.delete_all
Art.delete_all
User.delete_all

NUM_ARTS = 20
NUM_USERS = 10
PASSWORD = 'supersecret'

super_user = User.create(
    first_name: "Jon",
    last_name: "Snow",
    email: "js@winterfell.gov",
    password: PASSWORD,
)

NUM_USERS.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
        password: PASSWORD
    )
end

users = User.all


NUM_ARTS.times do
    created_at = Faker::Date.backward(days: 365)
    a=Art.create(
        title: Faker::Hacker.say_something_smart,
        description: Faker::ChuckNorris.fact,
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )
    if a.valid?
          a.comments = rand(0..20).times.map do
              Comment.new(
                  body: Faker::GreekPhilosophers.quote,
                  user: users.sample
              )
          end
    end
  end

  art = Art.all
  comment = Comment.all

  puts Cowsay.say("Generated #{art.count} arts", :frogs)
  puts Cowsay.say("Generated #{comment.count} comments for arts", :tux)
  puts "Login with #{super_user.email} and password: #{PASSWORD}"
