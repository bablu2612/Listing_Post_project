class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buyer_listings, dependent: :destroy

  enum role:{"admin": "admin","buyer": "buyer", "seller": "seller"}

  def name 
    "#{self.first_name} #{self.last_name}"
  end
end
