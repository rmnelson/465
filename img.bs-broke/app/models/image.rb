class Image < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :acls
  has_many :users, through: :acls
  accepts_nested_attributes_for :tags, :allow_destroy => true
  accepts_nested_attributes_for :acls, :allow_destroy => true
end
