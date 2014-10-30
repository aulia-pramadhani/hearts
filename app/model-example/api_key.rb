require 'digest/md5'

class ApiKey < ActiveRecord::Base
  attr_accessible :key, :description

  validates :key, :presence => true, :uniqueness => true, :length => { :minimum => 12 },
    :format => { :with => /\A[a-zA-Z0-9]+\z/, :message => "May contain only alphabet and numeric." }

  private

  after_initialize do
    if new_record?
      self.key ||= Digest::MD5.hexdigest(rand(10**10).to_s)
    end
  end

end

# ApiKey.auto_upgrade!
