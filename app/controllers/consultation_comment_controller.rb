class ConsultationCommentController < ApplicationController
  def create
    @comment = ConsultationComment.new(consultation_params)
    if @comment.save
      redirect_to consultation_url(@comment.consultation), notice: '投稿しました。'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render 'consultations/show'
    end
  end

  def consultation_params
    params.require(:consultation_comment).permit(:content, :user_id, :consultation_id, { image: [] })
  end
end
