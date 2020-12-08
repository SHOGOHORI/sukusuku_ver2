class ConsultationCommentController < ApplicationController
  def new
    @consultation_comment = Consultation_comment.new
  end

  def create
  end
end
