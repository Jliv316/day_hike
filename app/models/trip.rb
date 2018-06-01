class Trip < ApplicationRecord

  has_many :trip_trails
  has_many :trails, through: :trip_trails
  
  def total_distance
    trails.sum(:length)
    # trails.each do |trail|
    #   length = trail.length
    # Trail.where(trip_id: id).
  end

  def average_distance
    trails.average(:length)
    # trails.each do |trail|
    #   length = trail.length
    # Trail.where(trip_id: id).
  end

  def max_distance
    return 'non' if trails == []
    max = trails.order('length DESC').first.length
  end

  def min_distance
    return 'non' if trails == []
    trails.order('length ASC').first.length
  end
end
