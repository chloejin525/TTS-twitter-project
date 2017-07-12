# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1= User.create(name: "Ling", username: "Ling", following: [], avatar: "#", email: "chloejin525@gmail.com", password: "123456" , bio: "Hi!", location: "Cary" )
u2= User.create(name: "Adam", username: "Adam", following: [], avatar: "#", email: "adam@fake.com", password: "123456" , bio: "Hi!", location: "Chapel Hill" )
u3= User.create(name: "Mary", username: "Mary", following: [], avatar: "#", email: "mary@fake.com", password: "123456" , bio: "Hi!", location: "Durham" )
u4= User.create(name: "Linda", username: "Linda", following: [], avatar: "#", email: "linda@fake.com", password: "123456" , bio: "Hi!", location: "Raleigh" )


t1= Tweet.create(message: "Donec nibh libero, maximus at gravida non, posuere imperdiet ante.", user_id: u4.id)
t2= Tweet.create(message: "Praesent varius ex in maximus tincidunt.", user_id: u4.id)
t3= Tweet.create(message: "Quisque congue volutpat velit eget sollicitudin.", user_id: u2.id)
t4= Tweet.create(message: "Fusce non tortor vitae libero iaculis porttitor.", user_id: u3.id)
t5= Tweet.create(message: "Vestibulum justo arcu, molestie vel convallis in, eleifend vitae purus.", user_id: u4.id)
t6= Tweet.create(message: "Nam vel convallis eros, vitae varius dolor. ", user_id: u3.id)
t7= Tweet.create(message: "Quisque congue volutpat velit eget sollicitudin.", user_id: u3.id)
