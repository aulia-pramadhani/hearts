class ChannelBlockingPeriod < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :repeat, :channel_blocking_id, :id
  belongs_to :channel_blocking, :touch => true

  validates :start_time, :end_time, :repeat, :presence => true

end
