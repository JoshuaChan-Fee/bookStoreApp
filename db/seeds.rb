# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_store = Store.create(
	[
		{ name: "Indigo" }, 
		{ name: "Chapters" }
	]
)

Book.create(
	[
		{ name: "Harry Potter and the Sorcerer's Stone", stock: 1, store_id: Store.first.id },
		{ name: "The Lord of the Rings: The Fellowship of the Ring", stock: 0, status: "out of stock", store_id: Store.second.id }
	]
)
