class Profile
  include Mongoid::Document
  field :title, type: String
  field :id, type: Integer
  field :firstPriority, type: Hash
  field :secondPriority, type: Hash
  field :thirdPriority, type: Hash
  field :fourthPriority, type: Hash
  field :created, type: DateTime, default: ->{ DateTime.now }
end
