for i in 1..10
    first_name = Faker::Name.first_name,
    last_name = Faker::Name.last_name,
    user = User.create(
        email: "test+#{i}@test.com",
        password: "Testing123",
        first_name: first_name,
        last_name: last_name,
        username: "#{first_name}+ #{last_name}",
        address: Faker::Address.city,
        about: Faker::Lorem.paragraph
    )
    puts "Created user #{user.id}"

#     for y in 1..rand(1..3)
#         user.listings.create(
#         title: Faker::Coffee.origin,
#         price: rand(100..300000),
#         color: Faker::Color.color_name,
#         fabric: Faker::Ancient.primordial,
#         description: Faker::Lorem.paragraph    
#     )
     
# end
#     puts "Created  listing #{y} on user #{user.id}"
    

end
       