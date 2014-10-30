class Feedback < ActiveRecord::Base
    belongs_to :api_user
    has_one :device_information

    attr_accessible :message, :api_user, :device_informations, :is_from_admin, :timestamp, :status
    
    validates :message, :presence => true, :allow_blank => false
    validates :status, :presence => true

    before_save do
        self.timestamp = DateTime.now.utc.to_i
    end
end