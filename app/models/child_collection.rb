class Form::ChildCollection < Form::Base
  FORM_COUNT = 3
  attr_accessor :children

  def initialize(attributes = {})
    super attributes
    self.children = FORM_COUNT.times.map { Child.new() } unless self.children.present?
  end

  def children_attributes=(attributes)
    self.children = attributes.map { |_, v| Child.new(v) }
  end

  def save
    Child.transaction do
      self.children.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end
