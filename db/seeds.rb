# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



action = Category.create(name:"Action")
drama = Category.create(name:"Drama")
horror = Category.create(name:"Horror")
anime = Category.create(name:"Anime")


Video.create(title:"One", description:"One description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: action)
Video.create(title:"One", description:"One description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: action)
Video.create(title:"One", description:"One description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: action)
Video.create(title:"One", description:"One description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: action)
Video.create(title:"One", description:"One description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: action)
Video.create(title:"One", description:"One description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: action)
Video.create(title:"One", description:"One description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: action)
Video.create(title:"One", description:"One description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: action)
Video.create(title:"Two", description:"Two description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: drama)
Video.create(title:"Three", description:"Three description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: horror)
Video.create(title:"Four", description:"Four description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: anime)
Video.create(title:"Two", description:"Two description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: drama)
Video.create(title:"Three", description:"Three description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: horror)
Video.create(title:"Four", description:"Four description", lagre_url:"monk_large.jpg", small_url:"futurama.jpg", category: anime)
Video.create(title:"Two", description:"Two description", lagre_url:"tmp/futurama.jpg", small_url:"futurama.jpg", category: drama)
Video.create(title:"Three", description:"Three description", lagre_url:"tmp/futurama.jpg", small_url:"futurama.jpg", category: horror)
Video.create(title:"Four", description:"Four description", lagre_url:"tmp/futurama.jpg", small_url:"futurama.jpg", category: anime)
Video.create(title:"Two", description:"Two description", lagre_url:"tmp/futurama.jpg", small_url:"futurama.jpg", category: drama)
Video.create(title:"Three", description:"Three description", lagre_url:"tmp/futurama.jpg", small_url:"futurama.jpg", category: horror)
Video.create(title:"Four", description:"Four description", lagre_url:"tmp/futurama.jpg", small_url:"futurama.jpg", category: anime)
