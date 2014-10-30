class Board < ActiveRecord::Base
    has_many :players
    attr_accessible :players    
end