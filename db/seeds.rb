puts "Creating users"
User.create(name: 'Charlie', age: 26, username: 'DraGoNkILlA', password: 'password', bio: 'Just do it.')
User.create(name: 'Sean', age: 24, username: 'SirLogan', password: 'password', bio: 'Just an animal looking for a home.')
User.create(name: 'Daniel', age: 25, username: 'Big_D', password: 'password', bio: 'Big D jus chillen\'')
puts "Created users"

puts "Creating locations"
Location.create(neighborhood: 'Upper West Side')
Location.create(neighborhood: 'Upper East Side')
Location.create(neighborhood: 'Williamsburg')
Location.create(neighborhood: 'Lower East Side')
Location.create(neighborhood: 'Financial District')
puts "Created locations"

puts "Creating stories"
Story.create(title: 'Hamburger Squirrel', content: 'Saw a hamburger eating a squirrel.', user_id: 1, location_id: 2)
Story.create(title: 'Sick woman on subway', content: 'She was sick. People helped her and then went on with their days.', user_id: 2, location_id: 1)
Story.create(title: 'Peed a lot today.', content: 'I peed three times already today.', user_id: 3, location_id: 5)
puts "Created stories"
