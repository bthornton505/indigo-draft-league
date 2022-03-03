class Team < ApplicationRecord
  belongs_to :trainer 
  belongs_to :league 

  validates :name, presence: true
end
