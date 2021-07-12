# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

infos = Info.create([
    {
        firstname: "John",
        lastname: "DO",
        email: "john.do@gmail.com"
    },
])

messages = Message.create([
    {
        review: "Aliquam accumsan commodo risus at dapibus. Suspendisse at diam a magna euismod suscipit. Ut vel erat congue, fringilla tortor sed, dictum quam",
        info: infos.first
    },
])