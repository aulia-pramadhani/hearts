class Schedule < ActiveRecord::Base

  belongs_to :channel #Copy from show_program.channel. Used for rails_admin filter
  belongs_to :show_program

  attr_accessible :id, :start_time, :end_time, :day,  :show_program, :start_day, :end_day, :active, :reactivate_after, :channel_id, :show_program_id

  def start
  	[self.start_day, self.start_time.strftime("%H:%M:%S")].join(" - ")
  end

  def finish
  	[self.end_day, self.end_time.strftime("%H:%M:%S")].join(" - ")
  end
end