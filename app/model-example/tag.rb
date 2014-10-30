class Tag < ActiveRecord::Base
    has_many :show_program_tags
    has_many :show_programs, :through => :show_program_tags
    has_many :api_users, :through => :show_program_tags

    attr_accessible :name, :show_programs

    def search(query)
        lookup = "#{query}%"
        Tag.where("`name` LIKE :lookup", {lookup: lookup})
    end

end