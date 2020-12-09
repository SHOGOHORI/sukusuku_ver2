class ConsultationCommentController < ApplicationController
  def new
    @comment = ConsultationComment.new
  end

  def create
    @comment = ConsultationComment.new(consultation_params)
  end

  def consultation_params
    params.require(:consultation_comment).permit(:content, :user_id, :consultation_id, { image: [] })
  end
end
