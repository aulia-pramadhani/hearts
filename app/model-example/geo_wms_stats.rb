class GeoWmsStat < ActiveRecord::Base
	# blame ruby for its singularize method not working correctly in this particular case.
	# overal it's a good function though, cool even.
	belongs_to :wms_stats
	attr_accessible :country, :viewer, :wms_stats_id
end