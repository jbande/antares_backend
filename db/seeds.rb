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


juan = User.find_or_create_by(
    first_name: 'Juan',
    last_name: 'Perez',
    email: 'juanperez@gmail.com',
    password: '111111'
)

cuban_regions.each do |reg|
  Region.find_or_create_by(name: reg, country_code: 'CU')
end

amenities = [
    {label: "air-conditioner", icon_name:  "i-air-conditioner"},
    {label: "balcony", icon_name:  "i-balcony"},
    {label: "breakfast", icon_name:  "i-breakfast"},
    {label: "cocktail", icon_name:  "i-cocktail"},
    {label: "dinner", icon_name:  "i-dinner"},
    {label: "laundry-service", icon_name:  "i-laundry-service"},
    {label: "lunch", icon_name:  "i-lunch"},
]

acc_extras = [
    {label: "air-conditioner", icon_name:  "i-air-conditioner"},
    {label: "balcony", icon_name:  "i-balcony"},
    {label: "breakfast", icon_name:  "i-breakfast"},
    {label: "cocktail", icon_name:  "i-cocktail"},
    {label: "dinner", icon_name:  "i-dinner"},
    {label: "laundry-service", icon_name:  "i-laundry-service"},
    {label: "lunch", icon_name:  "i-lunch"},
    {label: "prize", icon_name:  "i-prize"},

]

room_amenities = [
    {label: "bath", icon_name:  "i-bath"},
    {label: "fridge", icon_name:  "i-fridge"},
    {label: "mirror", icon_name:  "i-mirror"},
    {label: "laitera", icon_name:  "i-laitera"},
    {label: "safe", icon_name:  "i-safe"},
    {label: "tv", icon_name:  "i-tv"},
    {label: "safe", icon_name:  "i-safe"},
]

acc_extras.each do |ex|
  AccomExtra.find_or_create_by(ex)
end

amenities.each do |am|
  Amenity.find_or_create_by(am)
end

room_amenities.each do |ro|
  RoomAmenity.find_or_create_by(ro)
end

all_icons = [{label: "Facebook-Icon", icon_name:  "i-Facebook-Icon"},

 {label: "Facebook-Icon", icon_name:  "i-Google-Icon"},

 {label: "Instagram-Icon", icon_name:  "i-Instagram-Icon"},

 {label: "Linkedin-Icon", icon_name:  "i-Linkedin-Icon"},

 {label: "Twitter-Icon", icon_name:  "i-Twitter-Icon"},

 {label: "air-conditioner", icon_name:  "i-air-conditioner"},

 {label: "balcony", icon_name:  "i-balcony"},

 {label: "bath", icon_name:  "i-bath"},

 {label: "bed", icon_name:  "i-bed"},

 {label: "breakfast", icon_name:  "i-breakfast"},

 {label: "btn_back", icon_name:  "i-btn_back"},

 {label: "btn_next", icon_name:  "i-btn_next"},

 {label: "cancel", icon_name:  "i-cancel"},

 {label: "change_pic", icon_name:  "i-change_pic"},

 {label: "checked", icon_name:  "i-checked"},

 {label: "close", icon_name:  "i-close"},

 {label: "cocktail", icon_name:  "i-cocktail"},

 {label: "dinner", icon_name:  "i-dinner"},

 {label: "down", icon_name:  "i-down"},

 {label: "dropdown", icon_name:  "i-dropdown"},

 {label: "edit_caption", icon_name:  "i-edit_caption"},

 {label: "empty", icon_name:  "i-empty"},

 {label: "find", icon_name:  "i-find"},

 {label: "fridge", icon_name:  "i-fridge"},

 {label: "img_ico", icon_name:  "i-img_ico"},

 {label: "laitera", icon_name:  "i-laitera"},

 {label: "language", icon_name:  "i-language"},

 {label: "laundry-service", icon_name:  "i-laundry-service"},

 {label: "location", icon_name:  "i-location"},

 {label: "logo", icon_name:  "i-logo"},

 {label: "lunch", icon_name:  "i-lunch"},

 {label: "mirror", icon_name:  "i-mirror"},

 {label: "next", icon_name:  "i-next"},

 {label: "notifications", icon_name:  "i-notifications"},

 {label: "ok", icon_name:  "i-ok"},

 {label: "overflow", icon_name:  "i-overflow"},

 {label: "people", icon_name:  "i-people"},

 {label: "pet", icon_name:  "i-pet"},

 {label: "prize", icon_name:  "i-prize"},

 {label: "restaurant", icon_name:  "i-restaurant"},

 {label: "room-key", icon_name:  "i-room-key"},

 {label: "safe", icon_name:  "i-safe"},

 {label: "smooking", icon_name:  "i-smooking"},

 {label: "star-fill", icon_name:  "i-star-fill"},

 {label: "star", icon_name:  "i-star"},

 {label: "telephone", icon_name:  "i-telephone"},

 {label: "television", icon_name:  "i-television"},

 {label: "towels", icon_name:  "i-towels"},

 {label: "translation", icon_name:  "i-translation"},

 {label: "trash", icon_name:  "i-trash"},

 {label: "tv", icon_name:  "i-tv"},

 {label: "up", icon_name:  "i-up"},

 {label: "wifi", icon_name:  "i-wifi"},

 {label: "edit-profile", icon_name:  "i-edit-profile"},

 {label: "hot-water", icon_name:  "i-hot_water"},

 {label: "i-user-default", icon_name:  "i-user-default"}]