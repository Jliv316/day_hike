class TrailsController < ApplicationController
  def index

  end

  def show
    @trail = Trail.find(params[:id])
    @trips = @trail.trips
  end
end