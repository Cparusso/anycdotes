class LocationsController < ApplicationController
  before_action :find_location, only: [:show]
  skip_before_action :authorized, only: [:index, :show]

  def index
    @locations = Location.all
  end

  def show

  end

  private

  def find_location
    @location = Location.find_by(id: params[:id])
  end
end
