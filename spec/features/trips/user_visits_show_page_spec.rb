require 'rails_helper'

describe 'visitor' do
  context 'visits stations index page' do
    it 'should see a list of stations with all attributes' do

      trip = Trip.create(name: 'Garden of the Gods')
      trail1 = trip.trails.create(name: 'trail 1', address: "122 garden rd", length: 20)
      trail2 = trip.trails.create(name: 'trail 1', address: "123 garden rd", length: 10)
      trail3 = trip.trails.create(name: 'trail 2', address: "124 garden rd", length: 30)
      
      visit trip_path(trip)

      expect(page).to have_content(trip.name)
      expect(page).to have_content(trail1.name)
      expect(page).to have_content(trail1.address)
      expect(page).to have_content(trail1.length)
    end

    it 'should show the total hiking distance for that trip' do

      trip = Trip.create(name: 'Garden of the Gods')
      trail1 = trip.trails.create(name: 'trail 1', address: "122 garden rd", length: 20)
      trail2 = trip.trails.create(name: 'trail 1', address: "123 garden rd", length: 10)
      trail3 = trip.trails.create(name: 'trail 2', address: "124 garden rd", length: 30)
      
      visit trip_path(trip)

      expect(page).to have_content(trip.total_distance)
    end

    it 'should show the average hiking distance for that trip' do

      trip = Trip.create(name: 'Garden of the Gods')
      trail1 = trip.trails.create(name: 'trail 1', address: "122 garden rd", length: 20)
      trail2 = trip.trails.create(name: 'trail 1', address: "123 garden rd", length: 10)
      trail3 = trip.trails.create(name: 'trail 2', address: "124 garden rd", length: 30)
      
      visit trip_path(trip)

      expect(page).to have_content(trip.average_distance)
    end

    it 'should show the max hiking distance for that trip' do

      trip = Trip.create(name: 'Garden of the Gods')
      trail1 = trip.trails.create(name: 'trail 1', address: "122 garden rd", length: 20)
      trail2 = trip.trails.create(name: 'trail 1', address: "123 garden rd", length: 10)
      trail3 = trip.trails.create(name: 'trail 2', address: "124 garden rd", length: 30)
      
      visit trip_path(trip)

      expect(page).to have_content(trip.max_distance)
    end

    it 'should show the max hiking distance for that trip' do

      trip = Trip.create(name: 'Garden of the Gods')
      trail1 = trip.trails.create(name: 'trail 1', address: "122 garden rd", length: 20)
      trail2 = trip.trails.create(name: 'trail 1', address: "123 garden rd", length: 10)
      trail3 = trip.trails.create(name: 'trail 2', address: "124 garden rd", length: 30)
      
      visit trip_path(trip)

      expect(page).to have_content(trip.min_distance)
    end

    it 'should have link to trail show page' do

      trip = Trip.create(name: 'Garden of the Gods')
      trail1 = trip.trails.create(name: 'trail 1', address: "122 garden rd", length: 20)
      trail2 = trip.trails.create(name: 'trail 2', address: "123 garden rd", length: 10)
      trail3 = trip.trails.create(name: 'trail 3', address: "124 garden rd", length: 30)
      
      visit trip_path(trip)

      click_on "#{trail1.name}"

      expect(current_path).to eq("/trails/#{trail1.id}")
    end


  end
end