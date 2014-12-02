class Ssid < ActiveRecord::Base
  belongs_to :user
  has_many :pullpoints
  has_many :gpspoints, through: :pollpoints
  accepts_nested_attributes_for :pullpoints, :allow_destroy => true
end
