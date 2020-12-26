class VoteCommentsController < ApplicationController
  before_action :set_comment, only: :destroy

  def create
    @comment = VoteComment.new(comment_params)
    if @comment.save
      redirect_to @comment.vote, notice: '投稿しました。'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render 'votes/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to request.referrer, notice: '削除しました'
  end

  private

  def comment_params
    params.require(:vote_comment).permit(:content, :user_id, :vote_id)
  end

  def set_comment
    @comment = VoteComment.find(params[:id])
    redirect_to(root_url) unless current_user.id == @comment.user_id
  end
end
