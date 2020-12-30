class Form::ItemCollection < Form::Base
  FORM_COUNT = 1
  attr_accessor :items

  def initialize(attributes = {})
    super attributes
    self.items = FORM_COUNT.times.map { VoteRelationship.new() } unless self.items.present?
  end

  def items_attributes=(attributes)
    self.items = attributes.map { |_, v| VoteRelationship.new(v) }
  end

  def save
    VoteRelationship.transaction do
      self.items.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end
