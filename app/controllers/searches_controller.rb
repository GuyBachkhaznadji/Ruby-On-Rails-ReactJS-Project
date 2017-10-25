class SearchesController < ApplicationController
  # before_action :authenticate_user!

  def index
      searches = Search.all.to_a
      render :json => searches
  end

  def create
      search = Search.create(search_params)
      search = search.generate_search
      render :json => search 
  end

  def update
      search_to_update = Search.find(params[:id])

      if search_to_update.update_attributes(search_params)
          render :json => search_to_update
      else
          render :json => {status: :update_failed}
      end

  end

  private
  def search_params
      params.permit([:title, :profileIndex, :jobDesc, :compRating, :conciseRating])
  end

end
