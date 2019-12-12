class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_many :reviews,  :dependent => :destroy
  has_many :therapy_groups, through: :reviews,  :dependent => :destroy

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
    user = User.create(name: data['name'],
    email: data['email'],
    password: Devise.friendly_token[0,20])
    end
    user
end

end
