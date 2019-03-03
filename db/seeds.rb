# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[Role, User, FloralSpecies, HabitatCategory, SubstrateCategory].each(&:delete_all)

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
    { name: "Jela", latin_name: "abies" },
    { name: "Ariš", latin_name: "larix" },
    { name: "Smrča", latin_name: "picea" },
    { name: "Tisa", latin_name: "taxus" },
    { name: "Čempres", latin_name: "" },
    { name: "Crni bor", latin_name: "" },
    { name: "Beli bor", latin_name: "" },
    { name: "Duglazija", latin_name: "" },
    { name: "Kedar", latin_name: "" },
    { name: "Molika", latin_name: "" },
    { name: "Javor", latin_name: "acer" },
    { name: "Breza", latin_name: "betula" },
    { name: "Grab", latin_name: "carpinus" },
    { name: "Kesten", latin_name: "castanea" },
    { name: "Dren", latin_name: "cornus" },
    { name: "Leska", latin_name: "corylus" },
    { name: "Glog", latin_name: "crategus" },
    { name: "Bukva", latin_name: "fagus" },
    { name: "Jasen", latin_name: "fraxinus" },
    { name: "Hrast", latin_name: "quercus" },
    { name: "Bagrem", latin_name: "robinia" },
    { name: "Malina", latin_name: "rubus" },
    { name: "Vrba", latin_name: "salix" },
    { name: "Zova", latin_name: "sambucus" },
    { name: "Lipa", latin_name: "tilia" },
    { name: "Jova", latin_name: "" },
    { name: "Jasika", latin_name: "" },
    { name: "Topola", latin_name: "" },
    { name: "Platan", latin_name: "" },
    { name: "Koprivić", latin_name: "" },
    { name: "Brest", latin_name: "" },
    { name: "Jabuka", latin_name: "malus" },
    { name: "Šljiva", latin_name: "prunus" },
    { name: "Orah", latin_name: "" },
    { name: "Višnja", latin_name: "" },
    { name: "Trešnja", latin_name: "" },
    { name: "Kruška", latin_name: "" },
    { name: "Festuca airoides", latin_name: "Festuca airoides" },
    { name: "Trnjina", latin_name: "" },
    { name: "Šipak", latin_name: "" }
  ]
)

jela = FloralSpecies.find_by(name: "Jela")
aris = FloralSpecies.find_by(name: "Ariš")
smrca = FloralSpecies.find_by(name: "Smrča")
tisa = FloralSpecies.find_by(name: "Tisa")
cempres = FloralSpecies.find_by(name: "Čempres")
crni_bor = FloralSpecies.find_by(name: "Crni bor")
beli_bor = FloralSpecies.find_by(name: "Beli bor")
duglazija = FloralSpecies.find_by(name: "Duglazija")
kedar = FloralSpecies.find_by(name: "Kedar")
molika = FloralSpecies.find_by(name: "Molika")
javor = FloralSpecies.find_by(name: "Javor")
breza = FloralSpecies.find_by(name: "Breza")
grab = FloralSpecies.find_by(name: "Grab")
kesten = FloralSpecies.find_by(name: "Kesten")
dren = FloralSpecies.find_by(name: "Dren")
leska = FloralSpecies.find_by(name: "Leska")
glog = FloralSpecies.find_by(name: "Glog")
bukva = FloralSpecies.find_by(name: "Bukva")
jasen = FloralSpecies.find_by(name: "Jasen")
hrast = FloralSpecies.find_by(name: "Hrast")
bagrem = FloralSpecies.find_by(name: "Bagrem")
malina = FloralSpecies.find_by(name: "Malina")
vrba = FloralSpecies.find_by(name: "Vrba")
zova = FloralSpecies.find_by(name: "Zova")
lipa = FloralSpecies.find_by(name: "Lipa")
jova = FloralSpecies.find_by(name: "Jova")
jasika = FloralSpecies.find_by(name: "Jasika")
topola = FloralSpecies.find_by(name: "Topola")
platan = FloralSpecies.find_by(name: "Platan")
koprivic = FloralSpecies.find_by(name: "Koprivić")
brest = FloralSpecies.find_by(name: "Brest")
jabuka = FloralSpecies.find_by(name: "Jabuka")
sljiva = FloralSpecies.find_by(name: "Šljiva")
orah = FloralSpecies.find_by(name: "Orah")
visnja = FloralSpecies.find_by(name: "Višnja")
tresnja = FloralSpecies.find_by(name: "Trešnja")
kruska = FloralSpecies.find_by(name: "Kruška")
festuca = FloralSpecies.find_by(name: "Festuca airoides")
trnjina = FloralSpecies.find_by(name: "Trnjina")
sipak = FloralSpecies.find_by(name: "Šipak")

coniferous_ids = [ jela.id, aris.id, smrca.id, tisa.id, cempres.id, crni_bor.id, beli_bor.id, duglazija.id, kedar.id, molika.id ]
deciduous_ids = [ javor.id, breza.id, grab.id, kesten.id, dren.id, leska.id, glog.id, bukva.id, jasen.id, hrast.id, bagrem.id, malina.id, vrba.id, zova.id, lipa.id, jova.id, jasika.id, topola.id, platan.id, koprivic.id, brest.id ]
orchard_ids = [ jabuka.id, sljiva.id, orah.id, visnja.id, tresnja.id, kruska.id, leska.id ]
herbaceous_ids = [ festuca.id ]
bushes_ids = [ glog.id, trnjina.id, sipak.id ]

habitat_categories = HabitatCategory.create(
  [
    { name: "Antropogena šuma", floral_species_ids: (coniferous_ids + deciduous_ids).flatten.uniq },
    { name: "Zimzelena šuma", floral_species_ids: coniferous_ids },
    { name: "Listopadna šuma", floral_species_ids: deciduous_ids },
    { name: "Mešovita šuma", floral_species_ids: (coniferous_ids + deciduous_ids).flatten.uniq },
    { name: "Slatkovodna močvara", floral_species_ids: [] },
    { name: "Livada", floral_species_ids: (coniferous_ids + deciduous_ids + bushes_ids).flatten.uniq },
    { name: "Peščara", floral_species_ids: (coniferous_ids + deciduous_ids).flatten.uniq },
    { name: "Tresetište", floral_species_ids: [] },
    { name: "Park", floral_species_ids: (coniferous_ids + deciduous_ids).flatten.uniq },
    { name: "Poljoprivredno zemljište", floral_species_ids: [] },
    { name: "Voćnjak", floral_species_ids: orchard_ids },
    { name: "Vinograd", floral_species_ids: [] },
    { name: "Grmlje", floral_species_ids: bushes_ids },
    { name: "Urbano / industrijsko područje", floral_species_ids: [] },
    { name: "Kamenito tlo", floral_species_ids: (coniferous_ids + deciduous_ids + bushes_ids).flatten.uniq },
    { name: "Drugo", floral_species_ids: [] }
  ]
)

substrate_categories = SubstrateCategory.create(
  [
    { name: "Zemljište", floral_species_ids: [] },
    { name: "Stelja", floral_species_ids: [] },
    { name: "Humus", floral_species_ids: [] },
    { name: "Živo stablo", floral_species_ids: (coniferous_ids + deciduous_ids + orchard_ids).flatten.uniq },
    { name: "Mrtvo uspravno stablo", floral_species_ids: (coniferous_ids + deciduous_ids + orchard_ids).flatten.uniq },
    { name: "Ležeće deblo", floral_species_ids: (coniferous_ids + deciduous_ids + orchard_ids).flatten.uniq },
    { name: "Ukopano drvo", floral_species_ids: [] },
    { name: "Zgarište", floral_species_ids: [] },
    { name: "Grane", floral_species_ids: (coniferous_ids + deciduous_ids + orchard_ids).flatten.uniq },
    { name: "Panj", floral_species_ids: (coniferous_ids + deciduous_ids + orchard_ids).flatten.uniq },
    { name: "Lišće", floral_species_ids: (coniferous_ids + deciduous_ids + orchard_ids).flatten.uniq },
    { name: "Šišarka", floral_species_ids: coniferous_ids },
    { name: "Žir", floral_species_ids: [] },
    { name: "Zeljaste biljke", floral_species_ids: [] },
    { name: "Mahovina", floral_species_ids: [] },
    { name: "Paprat", floral_species_ids: [] },
    { name: "Pesak", floral_species_ids: [] },
    { name: "Treset", floral_species_ids: [] },
    { name: "Životinja", floral_species_ids: [] },
    { name: "Feces", floral_species_ids: [] },
    { name: "Gljiva", floral_species_ids: [] },
    { name: "Specifična", floral_species_ids: [] }
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
