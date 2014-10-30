class ShowProgram < ActiveRecord::Base      
  belongs_to :channel
  has_many :schedules, :dependent => :delete_all

  has_many :show_program_tags, :dependent => :delete_all  
  has_many :tags, :through => :show_program_tags

  has_many :liked_program
  has_many :liking_users, :through => :liked_program, :source => :api_user
  
  validates :name, :presence => true
  validates :schedules, :length => {:minimum => 1, :message=>"Programs must at least has 1 schedules"}
  
  attr_accessible :name, :description, :channel, :channel_id, :id, :start_date, :end_date, :schedules, :tags
  def self.default_scope
    select("`show_programs`.`name`, `show_programs`.`channel_id`, `show_programs`.`id`, `show_programs`.`description`")
  end
end