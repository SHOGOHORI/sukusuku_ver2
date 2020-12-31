class Form::ItemCollection < Form::Base
  attr_accessor :vote_relationships

  def initialize(attributes = {})
    super attributes
    self.vote_relationships = FORM_COUNT.times.map { VoteRelationship.new() } unless self.vote_relationships.present?
  end

  def vote_relationships_attributes=(attributes)
    self.vote_relationships = attributes.map { |_, v| VoteRelationship.new(v) }
  end

  def save
    VoteRelationship.transaction do
      self.vote_relationships.map do |vote_relationship|
        if vote_relationship.present?
          vote_relationship.save
        end
      end
    end
      return true
    rescue => e
      return false
  end
end
