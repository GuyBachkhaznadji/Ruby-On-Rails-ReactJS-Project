class ReverseLookUpsController < ApplicationController
  
  def index
    reverse_look_ups = ReverseLookUp.all.to_a
    render :json => reverse_look_ups
  end
  
end
  