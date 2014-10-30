# Site specific settings:
#   Settings.version - version of db/models. every increase of this value lead to one-time reload page on clients
#     used for update JWPlayer, etc.

class Settings < ActiveRecord::Base
  attr_accessible :var, :value, :thing_type  
end

# Settings.auto_upgrade!