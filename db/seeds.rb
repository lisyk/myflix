# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.create(title:"One", description:"One description", lagre_url:"tmp/futurama.jpg", small_url:"futurama.jpg")
Video.create(title:"Two", description:"Two description", lagre_url:"tmp/futurama.jpg", small_url:"futurama.jpg")
Video.create(title:"Three", description:"Three description", lagre_url:"tmp/futurama.jpg", small_url:"futurama.jpg")
Video.create(title:"Four", description:"Four description", lagre_url:"tmp/futurama.jpg", small_url:"futurama.jpg")

Category.create(name:"Action")
Category.create(name:"Drama")
Category.create(name:"Horror")
Category.create(name:"Anime")
