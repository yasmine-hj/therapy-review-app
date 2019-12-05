class TherapyGroup < ApplicationRecord
  belongs_to :therapy_specialty
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :therapy_specialty
  
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :duration, presence: true

  scope :grouped_ratings, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

  def self.alphabetical_order
    order(:name)
  end



end
