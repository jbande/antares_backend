# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cuban_regions = ["Pinar del Rio",
"Habana",
"Mayabeque",
"Artemisa",
"Matanzas",
"Villa Clara",
"Cienfuegos",
"Ciego de Avila",
"Camaguey",
"Sancti Spiritus",
"Bayamo",
"Las Tunas",
"Holguin",
"Santiago de Cuba",
"Guantanamo",
"Isla de la Juventud",
"Granma"]


juan = User.create!(
    first_name: 'Juan',
    last_name: 'Perez',
    email: 'juanperez@gmail.com',
    password: '111111'
)

cuban_regions.each do |reg|
  Region.create!(name: reg, country_code: 'CU')
end


