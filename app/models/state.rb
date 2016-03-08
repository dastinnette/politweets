class State < ActiveRecord::Base
  has_many :tweets

  validates :name, presence: true
  validates :description, presence: true
end
