class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :images, dependent: :destroy
  has_many :image_users, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
