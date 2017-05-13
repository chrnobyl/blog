# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Chris", email: "chris@c.com", password: "myblog")

Post.create(title: "Hello World", content: "Hello world!", user_id: 1)

Comment.create(content: "Great first post!", user_id: 1, post_id: 1)

Tag.create(name: "First Post")

PostTag.create(post_id: 1, tag_id: 1)
