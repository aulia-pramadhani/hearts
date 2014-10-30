class LikedChannel < ActiveRecord::Base
	belongs_to :channel
	belongs_to :user	
	attr_accessible :channel_id, :user_id
end