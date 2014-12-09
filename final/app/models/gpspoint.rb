class Gpspoint < ActiveRecord::Base
  def lat
    (((self.latitude.split(" ",2)[1].to_f%100/60).round(7) + self.latitude.split(" ",2)[1].to_i/100))
  end
  def lng
    (-((self.longitude.split(" ",2)[1].to_f%100/60).round(7) + self.longitude.split(" ",2)[1].to_i/100))
  end
end
