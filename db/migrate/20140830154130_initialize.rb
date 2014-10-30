# rename to initialize
class Initialize < ActiveRecord::Migration
	def self.up
	  create_table "cards", :force => true do |t|
	    t.integer "value"
	    t.integer "type"	    
	  end

	  create_table "players", :force => true do |t|
	  	t.string "hearts_id"
	  	t.string "hearts_secret"
	  end

	  create_table "card_players", :force => true do |t|
	  	t.integer "card_id"
	  	t.integer "player_id"
	  end

	  create_table "boards", :force => true do |t|	  	
	  end

	  create_table "board_players", :force => true do|t|
	  	t.integer "board_id"
	  	t.integer "player_id"
	  end
	end

	def self.down
	end
end