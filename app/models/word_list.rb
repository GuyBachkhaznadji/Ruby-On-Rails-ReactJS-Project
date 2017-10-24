require_relative "./reverse_look_up.rb" 

class WordList
  include Mongoid::Document
  field :words, type: Array, default: ->{ [] }
  field :created, :type => DateTime, default: ->{ DateTime.now }


  def self.collect_words
    all_key_words = []
    reverses = ReverseLookUp.all.to_a

    for reverse in reverses
      all_key_words += reverse.searchableKeys
    end 
    all_key_words.sort!
    return all_key_words.uniq
  end

end
