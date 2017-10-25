class FeedbacksController < ApplicationController
  # before_action :authenticate_user!

  def index
      feedback = Feedback.all.to_a
      render :json => feedback
  end

  def create
      feedback = Feedback.create(feedback_params)
      render :json => feedback 
  end

  def feedback_params
      params.permit([:comments])
  end

end
