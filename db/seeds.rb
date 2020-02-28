for i in 1..10
    user = User.create(
        email: "test+#{i}@test.com",
        password: "Testing123"
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
       