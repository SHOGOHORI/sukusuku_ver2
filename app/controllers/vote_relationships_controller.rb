class VoteRelationshipsController < ApplicationController
  def create
    @vote_relationship = VoteRelationship.new(vote_relationship_params)
    if @vote_relationship.save
      redirect_to @vote_relationship.vote_item.vote, notice: '投票しました。'
    else
      flash[:alert] = '投票に失敗しました'
      redirect_to request.referer
    end
  end

  def destroy
    @vote = Vote.find(params[:vote_id])
    @vote_item = VoteItem.joins(:vote_relationships).find_by(vote_items: { vote: @vote} ,vote_relationships: { user: current_user })
    @vote_relationship = VoteRelationship.find_by(vote_item_id: @vote_item.id, user_id: current_user.id)
    @vote_relationship.destroy
    redirect_to @vote, notice: '投票を取り消しました'
  end

  private

  def vote_relationship_params
    params.require(:vote_relationship).permit(:user_id, :vote_item_id)
  end
end
