class Ssid < ActiveRecord::Base
  belongs_to :user
  has_many :pollpoints
  has_many :gpspoints, through: :pollpoints
  accepts_nested_attributes_for :pollpoints, :allow_destroy => true
 def first_high_lng
	if self.high_signal.nil? then
		return nil
	end

	begin
		foo = Gpspoint.find((Pollpoint.where(signal: self.high_signal, ssid_id: self.id).first.id)).lng
	rescue ActiveRecord::RecordNotFound => e
  	foo = nil
 	end
 end
 def first_high_lat
	if self.high_signal.nil? then
		return nil
	end

	begin
	foo = Gpspoint.find((Pollpoint.where(signal: self.high_signal, ssid_id: self.id).first.id)).lat
	rescue ActiveRecord::RecordNotFound => e
	foo = nil
	end
 end
end
