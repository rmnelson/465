class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ssids, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  def name_email
        "#{name} #{email}"
  end
end
