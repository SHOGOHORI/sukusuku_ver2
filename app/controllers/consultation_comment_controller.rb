class ConsultationCommentController < ApplicationController
  def new
    @comment = ConsultationComment.new
  end

  def create
    @comment = ConsultationComment.new
  end
end
