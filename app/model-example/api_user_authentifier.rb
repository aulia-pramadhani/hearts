class ApiUserAuthentifier < ActiveRecord::Base
	belongs_to :api_user	
	attr_accessible :mivo_id, :mivo_secret, :origin, :original_user_id, :api_user_id, :email
	
	validates :origin, :presence => {:message => "Origin must not be nil"}
	validates :original_user_id, :presence => {:message => "Original user id must not be nil"}

    # might be required on future release, but now email can't be retrieved.
	# validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	# validates :email, :presence => true
end