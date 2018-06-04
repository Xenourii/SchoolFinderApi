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
    student_number: 150,
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
    name: "Bellecour École",
    address: "18 Rue François Dauphin",
    zip_code: "69002",
    city: "Lyon",
    opening_hours: "De 8h45 à 20h",
    phone_number: "0478929283",
    email: "bellecour@lyon.com",
    latitude: 45.7553203,
    longitude: 4.832654700000035,
    student_number: 100,
    status: "private"
  },
  {
    name: "École centrale de Lyon",
    address: "36 Avenue Guy de Collongue",
    zip_code: "69134",
    city: "Lyon",
    opening_hours: "De 8h30 à 19h",
    phone_number: "0472186000",
    email: "ecolecentral@lyon.com",
    latitude: 45.76501959999999,
    longitude: 4.838126999999986,
    student_number: 700,
    status: "public"
  },
  {
    name: "ESTBB - École Supérieure de Biologie, Biochimie, Biotechnologies",
    address: "10 place des archives",
    zip_code: "69002",
    city: "Lyon",
    opening_hours: "De 7h à 15h",
    phone_number: "0472325198",
    email: "estbb@lyon.com",
    latitude: 45.746622,
    longitude: 4.826411000000007,
    student_number: 450,
    status: "public"
  },
  {
    name: "ECAM Lyon",
    address: "40 Montée Saint-Barthélémy",
    zip_code: "69321",
    city: "Lyon",
    opening_hours: "De 6h à 12h30",
    phone_number: "0472770600",
    email: "ecam@lyon.com",
    latitude: 45.7644165,
    longitude: 4.824784200000067,
    student_number: 90,
    status: "private"
  },
  {
    name: "Ecole Publique Albert Camus",
    address: "Quai Jean Moulin",
    zip_code: "69002",
    city: "Lyon",
    opening_hours: "De 10h à 18h",
    phone_number: "0478363613",
    email: "albertcamus@lyon.com",
    latitude: 45.7553203,
    longitude: 4.832654700000035,
    student_number: 20,
    status: "public"
  });
