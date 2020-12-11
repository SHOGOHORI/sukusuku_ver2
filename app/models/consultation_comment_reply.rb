class ConsultationCommentReply < ApplicationRecord
  belongs_to :user
  belongs_to :consultation_comment
end
