class ConsultationCommentController < ApplicationController
  before_action :set_comment, only: :destroy

  def create
    @comment = ConsultationComment.new(comment_params)
    if @comment.save
      redirect_to consultation_url(@comment.consultation), notice: '投稿しました。'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render 'consultations/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to request.referrer, notice: '削除しました'
  end

  private

  def comment_params
    params.require(:consultation_comment).permit(:content, :user_id, :consultation_id, { image: [] })
  end

  def set_comment
    @comment = ConsultationComment.find(params[:id])
    @consultation = @comment.consultation
    redirect_to(root_url) unless current_user.id == @comment.user_id
  end
end
