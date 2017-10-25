class WordListsController < ApplicationController
  
  def index
    word_lists = WordList.all.to_a
    render :json => word_lists
  end
  
end
  