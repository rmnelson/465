class Pollpoint < ActiveRecord::Base
  belongs_to :ssid
  belongs_to :gpspoint
end
