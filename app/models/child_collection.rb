class ChildCollection
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  CHILD_NUM = 3
  attr_accessor :collection

  # 初期化メソッド
  def initialize(attributes = [])
    if attributes.present?
      self.collection = attributes.map do |value|
        Child.new(
          user_id: value['user_id'],
          child_number: value['child_number'],
          nick_name: value['nick_name'],
          birthday: value['birthday']
        )
      end
    else
      self.collection = CHILD_NUM.times.map{ Child.new }
    end
  end

  # レコードが存在するか確認するメソッド
  def persisted?
    false
  end
end
