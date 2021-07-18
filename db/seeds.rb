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
        lastname: "Do",
        email: "john.do@gmail.com",
        message_attributes: 
				{
					review: "lorem ipsum dolor"
				}
    },
    {
        firstname: "Annabelle",
        lastname: "Poupé",
        email: "annabelle@mail.com",
        message_attributes: 
				{
					review: "dummy text"
				}
    },
    {
        firstname: "Freddy",
        lastname: "Cruger",
        email: "freddy.crug@gmail.com",
        message_attributes: 
				{
					review: "randdom text"
				}
    },
    {
        firstname: "Tony",
        lastname: "Stark",
        email: "stark.tony@corporate.com",
        message_attributes: 
				{
					review: "Marvel avenger"
				}
    },
])

