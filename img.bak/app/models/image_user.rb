class ImageUser < ActiveRecord::Base
  belongs_to :Image
  belongs_to :User
end
