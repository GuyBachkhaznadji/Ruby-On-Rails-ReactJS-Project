require_relative "./reverse_look_up.rb" 
require_relative "./profile.rb" 

class Search
  include Mongoid::Document
  field :title, type: String
  field :profileIndex, type: String
  field :jobDesc, type: String
  field :jobDescArray, type: Array, default: ->{ [] }
  field :concise, type: String, default: ->{ "" }
  field :conciseRating, type: Integer, default: ->{ 0 }
  field :comprehensive, type: String, default: ->{ "" }
  field :compRating, type: Integer, default: ->{ 0 }
  field :created, :type => DateTime, default: ->{ DateTime.now }

  def clean_job_desc  
    self.jobDesc.gsub!(/[,:\/]/," ")
    self.jobDescArray = self.jobDesc.split(" ")
    self.jobDescArray.map!(&:downcase)
    self.jobDescArray.uniq!
    self.jobDescArray.sort! { |a, b| a <=> b }  
  end

  def matched_keys
    reverses = ReverseLookUp.all.to_a
    matches = []
    index = self.profileIndex.to_i

    for job_word in self.jobDescArray
      if reverses[index][:searchableKeys].include?(job_word) 
        
        matched_word = ReverseLookUp.remove_dot(job_word)
        matched_key = reverses[index][:keyWords][matched_word]
        matches << matched_key
      end

    end

    return matches
  end

  def get_concise_search_words(matches, profiles)
    correct_words = []

    for match in matches
  
      if match[1] == :firstPriority || match[1] == :secondPriority || match[1] == :thirdPriority
        correct_words << profiles[self.profileIndex.to_i][match[1]][match[0]][0]
      end
    end

    return correct_words.uniq
  end

  def get_comprehensive_search_words(matches, profiles)
    correct_words = []

    for match in matches
        correct_words << profiles[self.profileIndex.to_i][match[1]][match[0]]
    end

    return correct_words
  end

  def concise_into_syntax(words)
    search = [words.join(" AND ")]
    return search
  end


  def comp_into_syntax(words)
    all_words = []
    search = [words.join(" AND ")]

    for array in words
      first_level = [array.join(" OR ")]
      all_words << first_level
    end
    all_words = all_words.flatten
    all_words = [all_words.join(") AND (")]
    all_words[0].insert(0, "(")
    all_words[0] += ")"
    
    return all_words
  end

  def generate_search_both_searches(matches)
    profiles = Profile.all.to_a
    # searches = {}

    comp_words = self.get_comprehensive_search_words(matches, profiles)
    comp_search = self.comp_into_syntax(comp_words)
    self.comprehensive = comp_search[0]
    # searches[:comprehensive] = comp_search[0]
    
    concise_words = self.get_concise_search_words(matches, profiles)
    concise_search = self.concise_into_syntax(concise_words)
    self.concise = concise_search[0]
    # searches[:concise] = concise_search[0]
    return
  end


  def generate_search()
    self.clean_job_desc
    matches = self.matched_keys
    self.generate_search_both_searches(matches)
    self.save
    return self
  end

end
