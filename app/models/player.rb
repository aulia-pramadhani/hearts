class Player < ActiveRecord::Base
    has_many :cards    
    attr_accessible :namedoka, :secretdoka, :cards
end