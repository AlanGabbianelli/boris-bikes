it 'removes bikes from van once delivered' do
  bike = double(:bike, broken?: true)
  station = double(:station, separate_broken_bikes: [bike])
  garage = double(:garage, receive_bikes_from_van: [])
  subject.collect_bikes(station)
  garage.recieve_bikes_from_van(subject)
  expect
end
