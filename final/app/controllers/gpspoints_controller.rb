class GpspointsController < ApplicationController
  before_action :set_gpspoint, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @gpspoints = Gpspoint.all
    respond_with(@gpspoints)
  end

  def show
    respond_with(@gpspoint)
  end

  def new
    @gpspoint = Gpspoint.new
    respond_with(@gpspoint)
  end

  def edit
  end

  def create
    @gpspoint = Gpspoint.new(gpspoint_params)
    @gpspoint.save
    respond_with(@gpspoint)
  end

  def update
    @gpspoint.update(gpspoint_params)
    respond_with(@gpspoint)
  end

  def destroy
    @gpspoint.destroy
    respond_with(@gpspoint)
  end

  private
    def set_gpspoint
      @gpspoint = Gpspoint.find(params[:id])
    end

    def gpspoint_params
      params.require(:gpspoint).permit(:latitude, :longitude, :num_sats, :hdofp, :altitude, :hofgae, :speed_km, :speed_mph, :angle, :date, :time)
    end
  
end
