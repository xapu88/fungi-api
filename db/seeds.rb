# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[Role, User, FloralSpecies].each(&:delete_all)

roles = Role.create(
  [
    {
      name: "admin"
    },
    {
      name: "moderator"
    }
  ]
)

users = User.create(
  [
    {
      email: "test@fungi.com",
      password: "123123",
      password_confirmation: "123123",
      username: "testuser",
      full_name: "Test User",
      description: "This user's sole purpose is to test the api."
    },
    {
      email: "admin@fungi.com",
      password: "123123",
      password_confirmation: "123123",
      username: "testadmin",
      full_name: "Test Admin",
      description: "This user's sole purpose is to test the api.",
      role: Role.find_by(name: "admin")
    },
    {
      email: "moderator@fungi.com",
      password: "123123",
      password_confirmation: "123123",
      username: "testmod",
      full_name: "Test Moderator",
      description: "This user's sole purpose is to test the api.",
      role: Role.find_by(name: "moderator")
    }
  ]
)

floral_species = FloralSpecies.create(
  [
    {
      name: "Jela",
      latin_name: "abies"
    },
    {
      name: "Ariš",
      latin_name: "larix"
    },
    {
      name: "Smrča",
      latin_name: "picea"
    },
    {
      name: "Tisa",
      latin_name: "taxus"
    },
    {
      name: "Čempres",
      latin_name: ""
    },
    {
      name: "Crni bor",
      latin_name: ""
    },
    {
      name: "Beli bor",
      latin_name: ""
    },
    {
      name: "Duglazija",
      latin_name: ""
    },
    {
      name: "Kedar",
      latin_name: ""
    },
    {
      name: "Molika",
      latin_name: ""
    },
    {
      name: "Javor",
      latin_name: "acer"
    },
    {
      name: "Breza",
      latin_name: "betula"
    },
    {
      name: "Grab",
      latin_name: "carpinus"
    },
    {
      name: "Kesten",
      latin_name: "castanea"
    },
    {
      name: "Dren",
      latin_name: "cornus"
    },
    {
      name: "Leska",
      latin_name: "corylus"
    },
    {
      name: "Glog",
      latin_name: "crategus"
    },
    {
      name: "Bukva",
      latin_name: "fagus"
    },
    {
      name: "Jasen",
      latin_name: "fraxinus"
    },
    {
      name: "Hrast",
      latin_name: "quercus"
    },
    {
      name: "Bagrem",
      latin_name: "robinia"
    },
    {
      name: "Malina",
      latin_name: "rubus"
    },
    {
      name: "Vrba",
      latin_name: "salix"
    },
    {
      name: "Zova",
      latin_name: "sambucus"
    },
    {
      name: "Lipa",
      latin_name: "tilia"
    },
    {
      name: "Jova",
      latin_name: ""
    },
    {
      name: "Jasika",
      latin_name: ""
    },
    {
      name: "Topola",
      latin_name: ""
    },
    {
      name: "Platan",
      latin_name: ""
    },
    {
      name: "Koprivić",
      latin_name: ""
    },
    {
      name: "Brest",
      latin_name: ""
    },
    {
      name: "Jabuka",
      latin_name: "malus"
    },
    {
      name: "Šljiva",
      latin_name: "prunus"
    },
    {
      name: "Orah",
      latin_name: ""
    },
    {
      name: "Višnja",
      latin_name: ""
    },
    {
      name: "Trešnja",
      latin_name: ""
    },
    {
      name: "Kruška",
      latin_name: ""
    },
    {
      name: "Festuca airoides",
      latin_name: "Festuca airoides"
    },
    {
      name: "Trnjina",
      latin_name: ""
    },
    {
      name: "Šipak",
      latin_name: ""
    }
  ]
)

# observations = Observation.create(
#   [
#     {
#       description: "Made of chocolate",
#       area: "Novi Sad",
#       location: "Sadovi",
#       observed_at: "2018-06-22",
#       legator: User.find_by(email: "test@fungi.com")
#     },
#     {
#       description: "Only for replying to mentions and DMs",
#       area: "Beograd",
#       location: "Surcin",
#       observed_at: "2018-09-02",
#       legator: User.find_by(email: "test@fungi.com")
#     },
#     {
#       description: "A mafia crime drama starring Berlusconi",
#       area: "Novi Sad",
#       location: "Veternik",
#       observed_at: "2017-04-30",
#       legator: User.find_by(email: "test@fungi.com")
#     },
#     {
#       description: "Like Uno but involves drinking",
#       area: "Fruska Gora",
#       location: "Jazak",
#       observed_at: "2018-11-11",
#       legator: User.find_by(email: "test@fungi.com")
#     }
#   ]
# )
