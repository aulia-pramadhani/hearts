class WmsStats < ActiveRecord::Base
	has_many :geo_wms_stats
	attr_accessible :timing, :connected, :bandwidth, :id
end