class DeviceInformation < ActiveRecord::Base
    belongs_to :feedback
    attr_accessible :feedback, :os_name, :os_version, :model
    validates :os_name, :presence => true
    validates :os_version, :presence => true    
end