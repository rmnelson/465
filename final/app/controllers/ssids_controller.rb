class SsidsController < ApplicationController
  before_action :set_ssid, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @ssids = Ssid.all
    respond_with(@ssids)
  end

  def show
    respond_with(@ssid)
  end

  def new
    @ssid = Ssid.new
    respond_with(@ssid)
  end

  def edit
  end

  def create
    @ssid = Ssid.new(ssid_params)
    @ssid.save
    respond_with(@ssid)
  end

  def update
    @ssid.update(ssid_params)
    respond_with(@ssid)
  end

  def destroy
    @ssid.destroy
    respond_with(@ssid)
  end

  private
    def set_ssid
      @ssid = Ssid.find(params[:id])
    end

    def ssid_params
      params.require(:ssid).permit(:ssid, :bssid, :manufacture, :auth, :encryption, :sec_type, :radio_type, :channel, :transfer_rates, :special_transfer_rates, :high_signal, :high_rssi, :net_type, :label, :public, :user_id)
    end
end
