# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

observations = Observation.create(
  [
    {
      number: 000001,
      description: "Made of chocolate",
      area: "Novi Sad",
      location: "Sadovi"
    },
    {
      number: 000002,
      description: "Only for replying to mentions and DMs",
      area: "Beograd",
      location: "Surcin"
    },
    {
      number: 000003,
      description: "A mafia crime drama starring Berlusconi",
      area: "Novi Sad",
      location: "Veternik"
    },
    {
      number: 000004,
      description: "Like Uno but involves drinking",
      area: "Fruska Gora",
      location: "Jazak"
    }
  ])
