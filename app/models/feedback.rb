class Feedback
  include Mongoid::Document
  field :comments, type: String
  field :user, type: Hash, default: ->{ false }
  field :read, type: Boolean, default: ->{ false }
  field :handled, type: Boolean, default: ->{ false }
  field :created, type: DateTime, default: ->{ DateTime.now }
end
