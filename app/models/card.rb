class Card < ActiveRecord::Base
    belongs_to :player
    attr_accessible :value, :type
end