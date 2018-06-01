require 'rails_helper'

describe 'visitor' do
  context 'visits stations index page' do
    it 'should see a list of stations with all attributes' do

      trip = Trip.create(name: 'Garden of the Gods')
      trip2 = Trip.create(name: 'Colorado Spring')
      trip3 = Trip.create(name: 'Aspen')
      trail1 = trip.trails.create(name: 'trail 1', address: "122 garden rd", length: 20)
      TripTrail.create(trip_id: trip2.id, trail_id: trail1.id)
      TripTrail.create(trip_id: trip3.id, trail_id: trail1.id)

      visit trail_path(trail1)
      save_and_open_page
      expect(page).to have_content("total number of hiking trips: #{trail1.total_trips}")
    end
  end
end