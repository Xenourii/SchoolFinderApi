# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create({
    email: 'user@user.com'
    password: 'user1234!'
    password_confirmation: 'user1234!'
  },
  {
      email: 'admin@admin.com'
      password: 'Passw0rd!'
      password_confirmation: 'Passw0rd!'
  })

School.create({
    name: "Pierre Termier",
    address: "23, rue des Alouettes",
    zip_code: "69003",
    city: "Lyon",
    opening_hours: "De 8h à 18h",
    phone_number: "0400000000",
    email: "contact@pierretermier.com",
    latitude: 45.74157630000001,
    longitude: 4.8714741,
    student_number: 30,
    status: "public"
  },
  {
    name: "Ynov",
    address: "27, rue Raoul Servant",
    zip_code: "69000",
    city: "Lyon",
    opening_hours: "De 9h à 17h",
    phone_number: "0400000000",
    email: "contact@ynov.com",
    latitude: 45.7456831,
    longitude: 4.837593400000006,
    student_number: 200,
    status: "private"
  },
  {
    name: "Lycée René Cassin",
    address: "49 Boulevard des 9 Clés",
    zip_code: "71000",
    city: "Mâcon",
    opening_hours: "8h-19h",
    phone_number: "0385395350",
    email: "jean.kevin@cassin.fr",
    latitude: 46.314784,
    longitude: 4.821120,
    student_number: 1000,
    status: "public"
  },
  {
    name: "École centrale de Lyon",
    address: "36 Avenue Guy de Collongue",
    zip_code: "69134",
    city: "Écully",
    opening_hours: "De 8h30 à 19h",
    phone_number: "0472186000",
    email: "ecolecentral@lyon.com",
    latitude: 48.862725,
    longitude: 2.287592000000018,
    student_number: 500,
    status: "public"
});
