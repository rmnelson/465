class Acl < ActiveRecord::Base
  belongs_to :ssid
  belongs_to :user
end
