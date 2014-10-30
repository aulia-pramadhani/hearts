require 'lib/fdoc/markdown_endpoint_presenter'
class API::Base < Grape::API    
    def self.inherited(subclass)
        super       
        subclass.instance_eval do            
            format :json                        
        end     
    end
end