class API::Cards < API::Base	
	desc 'search program by tags'
		get '/programs/search' do 
			payload = request.GET
			tags_query = payload["tags"]			
		end
	
	desc "list all program from a certain channel"
		get '/programs' do 						
			@result = ProgramLib::programListV2Mobile			
		end

	desc 'get program details'
		get '/programs/:program_id' do 
			program_id = params[:program_id]
			@result = ProgramLib::programDetailsV2Mobile(program_id)
		end

	desc "list all liked programs"
		post '/programs' do 
			mivo_id = request.POST["mivo_id"]
			mivo_secret = request.POST["mivo_secret"]			
			@result = ProgramLib::likedProgramsV2Mobile(mivo_id, mivo_secret)
		end

	desc "tags a program" 
		put '/programs/:program_id/tags' do 
            program_id = params[:program_id]
            payload = request.POST
            mivo_id = payload["mivo_id"]
            mivo_secret = payload["mivo_secret"]
            tags = payload["tags"]
            UserLib::tagProgram(mivo_id, mivo_secret, program_id, tags)
        end

	desc "like a program" 
		post '/programs/:program_id/like' do 
			mivo_id = request.POST["mivo_id"]
			mivo_secret = request.POST["mivo_secret"]			
			program_id = params[:program_id]
			@result = UserLib::likeProgram(mivo_id, mivo_secret, program_id)
		end

	desc "unlike a program"		 
		post "/programs/:program_id/unlike" do
			mivo_id = request.POST["mivo_id"]
			mivo_secret = request.POST["mivo_secret"]			
			program_id = params[:program_id]			
			@result = UserLib::unlikeProgram(mivo_id, mivo_secret, program_id)
		end
end
