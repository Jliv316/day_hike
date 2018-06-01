require 'rails_helper'

describe 'visitor' do
  context 'visits stations index page' do
    it 'should see a list of hiking trips' do

      trip1 = Trip.create(name: 'Garden of the Gods')
      trip2 = Trip.create(name: 'Aspen')
      trip3 = Trip.create(name: 'Horsetooth')

      
      visit trips_path

      expect(page).to have_content(trip1.name)
      expect(page).to have_content(trip2.name)
      expect(page).to have_content(trip3.name)
    end

    it 'should have links for each of the trip names' do 
      trip1 = Trip.create(name: 'Garden of the Gods')
      trip2 = Trip.create(name: 'Aspen')
      trip3 = Trip.create(name: 'Horsetooth')
      
      visit trips_path

      click_on 'Aspen'

      expect(current_path).to eq(trip_path(trip2))
    end
  end
end