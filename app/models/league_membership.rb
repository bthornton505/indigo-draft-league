class LeagueMembership < ApplicationRecord
  belongs_to :trainer 
  belongs_to :league
end
