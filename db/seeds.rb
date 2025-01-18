empresas = Race.create!(
  name: "Carrera de empresas valencia",
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
  name: "Carrera Runners Ciutat de València",
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
  name: "Medio Maratón Valencia",
  location: "Valencia",
  distance: 21_097,
  homologated: true
)
maraton = Race.create!(
  name: "Maratón Valencia",
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

empresas.rans.create!(
  edition: 9,
  date: Date.new(2022, 5, 3),
  time: 3_715,
  source: "Apple watch SE 2"
)

empresas.rans.create!(
  edition: 10,
  date: Date.new(2023, 5, 7),
  time: 3_847,
  source: "Apple watch SE 2"
)

diez_k.rans.create!(
  edition: 15,
  date: Date.new(2023, 1, 15),
  time: 4_180
)

diez_k.rans.create!(
  edition: 16,
  date: Date.new(2024, 1, 14),
  time: 3_355
)

diez_k.rans.create!(
  edition: 17,
  date: Date.new(2025, 1, 12),
  time: 2_937
)

galapagos.rans.create!(
  edition: 25,
  date: Date.new(2023, 1, 28),
  time: 1_525,
  source: "Apple watch SE 2"
)

never_stop.rans.create!(
  edition: 9,
  date: Date.new(2024, 2, 11),
  time: 1_600
)

redolat.rans.create!(
  edition: 9,
  date: Date.new(2024, 5, 12),
  time: 1_684
)

marta.rans.create!(
  edition: 6,
  date: Date.new(2024, 5, 26),
  time: 1_641
)

marcelino.rans.create!(
  edition: 46,
  date: Date.new(2024, 9, 22),
  time: 1_433,
  source: "Apple watch SE 2"
)

medio_maraton.rans.create!(
  edition: 33,
  date: Date.new(2024, 10, 27),
  time: 6_710
)

pas_ras.rans.create!(
  edition: 36,
  date: Date.new(2024, 12, 15),
  time: 2_885
)

brooks = Shoes.create!(
  brand: "Brooks",
  model: "Ghost 15",
  size: 44.4,
  purchased_at: Date.new(2024, 8, 30),
  price: 97.95
)

brooks.montly_distances.create!(
  month: Date.new(2024, 8, 1),
  distance: 7_990
)

brooks.montly_distances.create!(
  month: Date.new(2024, 9, 1),
  distance: 195_250
)

brooks.montly_distances.create!(
  month: Date.new(2024, 10, 1),
  distance: 184_270
)

brooks.montly_distances.create!(
  month: Date.new(2024, 11, 1),
  distance: 119_070
)

brooks.montly_distances.create!(
  month: Date.new(2024, 12, 1),
  distance: 146_180
)
