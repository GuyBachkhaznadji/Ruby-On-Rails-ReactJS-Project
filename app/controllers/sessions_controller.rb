class SessionsController < Devise::SessionsController  
    
    def new
        return super if !(request.xhr? or request.format == :json)
        render json: { success: false, errors: ["Login failed"] }, status: :unauthorized
    end
    
end 