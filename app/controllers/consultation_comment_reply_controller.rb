class ConsultationCommentReplyController < ApplicationController
  before_action :set_reply, only: :destroy

  def create
    @reply = ConsultationCommentReply.new(reply_params)
    @consultation = @reply.consultation_comment.consultation
    @comment = ConsultationComment.new
    @comments = @consultation.consultation_comments.recently.page(params[:page]).per(5)
    store_location
    respond_to do |format|
      format.html
      format.js
    end
    if @reply.save
      redirect_to consultation_url(@consultation), notice: '投稿しました。'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render 'consultations/show'
    end
  end

  def destroy
    @reply.destroy
    redirect_to request.referrer, notice: '削除しました'
  end

  private

  def reply_params
    params.require(:consultation_comment_reply).permit(:content, :user_id, :consultation_comment_id, { image: [] })
  end

  def set_reply
    @reply = ConsultationCommentReply.find(params[:id])
    redirect_to(root_url) unless current_user.id == @reply.user_id
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
