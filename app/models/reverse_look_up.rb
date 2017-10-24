require_relative "./profile.rb" 

class ReverseLookUp
  include Mongoid::Document
  field :title, type: String
  field :keyWords, type: Hash
  field :searchableKeys, type: Array
  field :created, :type => DateTime, default: ->{ DateTime.now }
  
    # Add constant variable for aeiou
    def self.remove_dot(word)
  
      if word.include?(".")
        word = word.gsub(/[.]/, 'aeiou')     
      end
      return word
    end
  
    def self.add_dot(word)
      if word.include?("aeiou")
        word = word.gsub(/aeiou/, ".")     
      end
      return word
    end
  
    def self.add_all_dots(words)
      corrected_words = []
  
      for word in words
        word = self.add_dot(word)
        corrected_words << word
      end
      return corrected_words
    end
  
    def self.reverse_map_priority(profile, priority)
      priority = priority.to_sym
      reverse_map = {}
  
      if profile[priority]   
        for key in profile[priority].keys
          key_words = profile[priority][key]
  
          for word in key_words
            word = word.to_s
            word = self.remove_dot(word)
            reverse_map[word] = [key, priority]
          end
        end
      end
      return reverse_map
    end
  
    def self.generate_searchable_keys(reversed_profile)
      keys_array = reversed_profile[:keyWords].keys
      keys_array.sort!
      return keys_array
    end
  
    def self.reverse_profile(profile)
      reverse_map = {}
      reverse_map[:title] = profile[:title]
      reverse_map[:keyWords] = {}
  
      first_priority = self.reverse_map_priority(profile, "firstPriority")
      second_priority = self.reverse_map_priority(profile, "secondPriority")
      third_priority = self.reverse_map_priority(profile, "thirdPriority")
      fourth_priority = self.reverse_map_priority(profile, "fourthPriority")
  
      first_priority.merge!(second_priority)
      first_priority.merge!(third_priority)
      first_priority.merge!(fourth_priority)
      reverse_map[:keyWords] = first_priority
  
      keys_array = self.generate_searchable_keys(reverse_map)
      keys_array = self.add_all_dots(keys_array)
      reverse_map[:searchableKeys] = keys_array
      
      return reverse_map
    end
  
    def self.generate_all_reverses
      ReverseLookUp.delete_all
      profiles = Profile.all.to_a
  
      for profile in profiles
        reversed_profile = self.reverse_profile(profile)
   
        ReverseLookUp.create(reversed_profile)
      end
  
    end

end
