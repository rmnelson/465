class PollpointsController < ApplicationController
  before_action :set_pollpoint, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pollpoints = Pollpoint.all
    respond_with(@pollpoints)
  end

  def show
    @ssid = Ssid.find(params[:ssid_id])
    respond_with(@pollpoint)
  end

  def new
    @pollpoint = Pollpoint.new
    respond_with(@pollpoint)
  end

  def edit
  end

  def create
    @pollpoint = Pollpoint.new(pollpoint_params)
    @pollpoint.save
    respond_with(@pollpoint)
  end

  def update
    @pollpoint.update(pollpoint_params)
    respond_with(@pollpoint)
  end

  def destroy
    @pollpoint.destroy
    respond_with(@pollpoint)
  end

  private
    def set_pollpoint
      @pollpoint = Pollpoint.find(params[:id])
    end

    def pollpoint_params
      params.require(:pollpoint).permit(:ssid_id, :gps_id, :signal, :rssi)
    end
end
