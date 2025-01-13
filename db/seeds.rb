# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

empresas = Race.create!(
  name: "Carrera de las empresas valencianas",
  location: "Valencia",
  distance: 10_000,
  homologated: false
)
diez_k = Race.create!(
  name: "10k Valencia ibercaja",
  location: "Valencia",
  distance: 10_000,
  homologated: true
)
galapagos = Race.create!(
  name: "Carrera Popular Galápagos 3F",
  location: "Valencia",
  distance: 5_000,
  homologated: false
)
never_stop = Race.create!(
  name: "Carrera Never Stop Running ‘Nunca te rindas’",
  location: "Valencia",
  distance: 5_000,
  homologated: true
)
redolat = Race.create!(
  name: "Carrera José Antonio Redolat",
  location: "Valencia",
  distance: 5_000,
  homologated: true
)
marta = Race.create!(
  name: "Carrera Marta Fernández de Castro",
  location: "Valencia",
  distance: 5_000,
  homologated: true
)
ciutat = Race.create!(
  name: "Volta a Peu Runners Ciutat de València",
  location: "Valencia",
  distance: 5_000,
  homologated: true
)
marcelino = Race.create!(
  name: "Volta a Peu als Barris Sant Marcel.lí i Sant Isidre",
  location: "Valencia",
  distance: 5_000,
  homologated: false
)
medio_maraton = Race.create!(
  name: "Medio maratón de Valencia",
  location: "Valencia",
  distance: 21_097,
  homologated: true
)
maraton = Race.create!(
  name: "Maratón de Valencia",
  location: "Valencia",
  distance: 42_195,
  homologated: true
)
pas_ras = Race.create!(
  name: "Pas Ras al Port de València",
  location: "Valencia",
  distance: 10_000,
  homologated: true
)

RaceRecord.create!(
  race: empresas,
  edition: 9,
  date: Date.new(2022, 5, 3),
  time: 3_715
)

RaceRecord.create!(
  race: diez_k,
  edition: 15,
  date: Date.new(2023, 1, 15),
  time: 4_180
)

RaceRecord.create!(
  race: empresas,
  edition: 10,
  date: Date.new(2023, 5, 7),
  time: 3_847
)

RaceRecord.create!(
  race: diez_k,
  edition: 16,
  date: Date.new(2024, 1, 14),
  time: 3355
)

RaceRecord.create!(
  race: galapagos,
  edition: 25,
  date: Date.new(2024, 1, 28),
  time: 1525
)

RaceRecord.create!(
  race: never_stop,
  edition: 9,
  date: Date.new(2024, 2, 11),
  time: 1_600
)

RaceRecord.create!(
  race: redolat,
  edition: 9,
  date: Date.new(2024, 5, 12),
  time: 1_684
)

RaceRecord.create!(
  race: marta,
  edition: 6,
  date: Date.new(2024, 5, 26),
  time: 1_641
)

RaceRecord.create!(
  race: ciutat,
  edition: 5,
  date: Date.new(2024, 9, 8),
  time: 1_492
)

RaceRecord.create!(
  race: marcelino,
  edition: 46,
  date: Date.new(2024, 9, 22),
  time: 1_433
)

RaceRecord.create!(
  race: medio_maraton,
  edition: 33,
  date: Date.new(2024, 10, 27),
  time: 6_710
)

RaceRecord.create!(
  race: pas_ras,
  edition: 36,
  date: Date.new(2024, 12, 15),
  time: 2_885
)

RaceRecord.create!(
  race: diez_k,
  edition: 17,
  date: Date.new(2025, 1, 12),
  time: 2_937
)
