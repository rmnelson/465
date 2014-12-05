class Ssid < ActiveRecord::Base
  belongs_to :user
  has_many :pollpoints
  has_many :gpspoints, through: :pollpoints
  accepts_nested_attributes_for :pollpoints, :allow_destroy => true
end
