class Form::VoteRelationshipCollection < Form::Base
  DEFAULT_ITEM_COUNT = 4
  attr_accessor :vote_relationships

  def initialize(attributes = {})
    super attributes
    self.vote_relationships = DEFAULT_ITEM_COUNT.times.map { Form::VoteRelationshipCollection.new } unless vote_relationships.present?
  end

  def vote_relationships_attributes=(attributes)
    self.products = attributes.map do |_, product_attributes|
      Form::Product.new(product_attributes).tap { |v| v.availability = false }
    end
  end

  def valid?
    valid_products = target_products.map(&:valid?).all?
    super && valid_products
  end

  def save
    return false unless valid?
    Product.transaction { target_products.each(&:save!) }
    true
  end

  def target_products
    self.products.select { |v| value_to_boolean(v.register) }
  end
end
