class Feedback
  include Mongoid::Document
  field :comments, type: String
  field :read, type: Boolean, default: ->{ false }
  field :handled, type: Boolean, default: ->{ false }
  field :created, type: DateTime, default: ->{ DateTime.now }
end
