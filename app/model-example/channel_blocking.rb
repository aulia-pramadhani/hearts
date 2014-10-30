class ChannelBlocking < ActiveRecord::Base
  belongs_to :channel, :touch => true
  has_and_belongs_to_many :countries
  has_many :channel_blocking_periods, :dependent => :delete_all

  attr_accessible :start_date, :end_date, :channel_id, :id, :continuous_date
  
  validates :channel_id, :start_date, :presence => true
  validates :end_date, :presence => true, :unless => :continuous_date
  validates :countries, :length => { minimum: 1, message: "must have at least one Country"}
  validates :channel_blocking_periods, :length => { minimum: 1, message: "must have at least one Period"}

end
