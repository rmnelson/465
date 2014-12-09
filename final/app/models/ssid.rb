class Ssid < ActiveRecord::Base
  belongs_to :user
  has_many :pollpoints
  has_many :gpspoints, through: :pollpoints
  accepts_nested_attributes_for :pollpoints, :allow_destroy => true
 def first_high_lng
	if self.high_signal.nil? then
		return -121.8641317
	end

	begin
		foo = self.pollpoints.order("signal DESC").first.gpspoint.lng 
	rescue ActiveRecord::RecordNotFound => e
  	foo = -121.8641317 
 	end
 end
 def first_high_lat
	if self.high_signal.nil? then
		return 39.738245
	end

	begin
	foo = self.pollpoints.order("signal DESC").first.gpspoint.lat
	rescue ActiveRecord::RecordNotFound => e
	foo = 39.738245
	end
 end
 def ssid_name
	if self.ssid.nil? then
		return ""
	end
	if self.ssid.empty?
		"HIDDEN"
	else
		self.ssid
	end
 end
end
