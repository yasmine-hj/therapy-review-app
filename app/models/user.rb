class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reviews
  has_many :therapy_groups, through: :reviews

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true

end
