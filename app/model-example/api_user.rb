class ApiUser < ActiveRecord::Base	
	has_many :bookmarked_channel
	has_many :bookmarked_channels, :through => :bookmarked_channel, :source => :channel, :dependent => :delete_all

	has_many :liked_program
	has_many :liked_programs, :through => :liked_program, :source => :show_program, :dependent => :delete_all

    has_many :show_program_tags
    has_many :tags, :through => :show_program_tags

    has_many :feedbacks

	has_many :api_user_authentifiers, :dependent => :delete_all	
	attr_accessible :name, :avatar_url, :api_user_authentifiers
	validates :api_user_authentifiers, :length => {minimum: 1, message: "Must have at least one authentifiers"}
    validates :name, :presence => true
end