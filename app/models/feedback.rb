class Feedback
  include Mongoid::Document
  field :comments, type: String
  field :created, type: DateTime, default: ->{ DateTime.now }
end
