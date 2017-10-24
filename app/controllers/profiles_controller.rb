class ProfilesController < ApiController
  
  # GET /profiles
  def index
    profiles = Profile.all.to_a
    render :json => profiles
  end



end
