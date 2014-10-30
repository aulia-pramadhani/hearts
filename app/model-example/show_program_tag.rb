class ShowProgramTag < ActiveRecord::Base
    belongs_to :show_program
    belongs_to :tag
    belongs_to :api_user
    attr_accessible :show_program, :tag, :api_user
    validates :show_program, :presence => true
    validates :tag, :presence => true
    validates :api_user, :presence => true
    # validates :api_user, :length => {:minimum => 1, :message=>"Show Program Tag must have at least 1 user who tagged it."}
end