class BookmarkedChannel < ActiveRecord::Base
	self.table_name = "bookmarked_channels"
	belongs_to :channel
	belongs_to :user
end