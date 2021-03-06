class ConsultationCommentController < ApplicationController
  before_action :set_comment, only: :destroy

  def create
    @comment = ConsultationComment.new(comment_params)
    @consultation = @comment.consultation
    @comments = @consultation.consultation_comments.recently.page(params[:page]).per(5)
    @reply = ConsultationCommentReply.new
    store_location
    respond_to do |format|
      format.html
      format.js
    end
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
    params.require(:consultation_comment).permit(:content, :consultation_id, { image: [] }).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = ConsultationComment.find(params[:id])
    redirect_to(root_url) unless current_user.id == @comment.user_id
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
