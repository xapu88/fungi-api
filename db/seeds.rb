# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
  [
    {
      email: "test@fungi.com",
      password: "123123",
      password_confirmation: "123123",
      username: "testuser",
      full_name: "Test User",
      description: "This user's sole purpose is to test the api."
    }
  ]
)

observations = Observation.create(
  [
    {
      description: "Made of chocolate",
      area: "Novi Sad",
      location: "Sadovi",
      observed_at: "2018-06-22",
      legator: User.find_by(email: "test@fungi.com")
    },
    {
      description: "Only for replying to mentions and DMs",
      area: "Beograd",
      location: "Surcin",
      observed_at: "2018-09-02",
      legator: User.find_by(email: "test@fungi.com")
    },
    {
      description: "A mafia crime drama starring Berlusconi",
      area: "Novi Sad",
      location: "Veternik",
      observed_at: "2017-04-30",
      legator: User.find_by(email: "test@fungi.com")
    },
    {
      description: "Like Uno but involves drinking",
      area: "Fruska Gora",
      location: "Jazak",
      observed_at: "2018-11-11",
      legator: User.find_by(email: "test@fungi.com")
    }
  ]
)
