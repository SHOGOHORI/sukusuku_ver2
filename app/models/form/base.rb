module Form
  class Base
    include ActiveModel::Model
    include ActiveModel::Callbacks
    include ActiveModel::Validations
    include ActiveModel::Validations::Callbacks
  end
end
