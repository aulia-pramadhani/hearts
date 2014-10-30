require File.expand_path('../environment', __FILE__)
module API
  module V1
  end
end

Dir["#{File.dirname(__FILE__)}/app/models/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/app/api/web/*.rb"].each {|f| require f}

ActiveRecord::Base.instance_eval do 
	include ActiveModel::MassAssignmentSecurity
	attr_accessible []
end


class API::Root < Grape::API    
  format :json  

  before do      
    header["Access-Control-Allow-Origin"] = headers["Origin"]
    header['Access-Control-Allow-Headers'] = headers["Access-Control-Request-Headers"] #unless headers["Access-Control-Request-Headers"].nil?
    header['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    header['Access-Control-Max-Age'] = '0'
    header['Access-Control-Expose-Headers'] = 'ETag'
    header['Access-Control-Allow-Credentials'] = 'true'
  end

  mount API::Base
  mount API::Cards
end

SprocketsApp = Sprockets::Environment.new
SprocketsApp.append_path "app/javascripts"

ApplicationServer = Rack::Builder.new {
  use Rack::Static, :urls => [
    '/jquery.js',
    '/mivo.html',
    '/404.png',
    '/404.html'
  ], :root => "public", index: 'index.html'

  map "/javascripts" do
    run SprocketsApp
  end

  map "/" do
    run API::Root    
  end    
}