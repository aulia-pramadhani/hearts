class LikedProgram < ActiveRecord::Base
	belongs_to :show_program
	belongs_to :api_user
	attr_accessible :show_program_id, :api_user_id
end