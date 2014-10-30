
class TimeZone < ActiveRecord::Base

  has_many :channels

  validates :name, :gmt_offset, :presence => true
  validates :name, :uniqueness => {:scope => :gmt_offset}
  attr_accessible :name, :gmt_offset

end