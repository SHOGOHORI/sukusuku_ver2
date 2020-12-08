class ConsultationComment < ApplicationRecord
  belongs_to :user
  belongs_to :consultation
end
