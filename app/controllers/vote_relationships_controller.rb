class VoteRelationshipsController < ApplicationController

  def create
    @vote_relationship = VoteRelationship.new(vote_relationship_params)
    @vote = @vote_relationship.vote
    if @vote_relationship.save
      redirect_to @vote_relationship.vote, notice: '投票しました。'
    else
      flash.now[:alert] = '投票に失敗しました'
      render 'votes/show'
    end
  end

  def destroy
  end

  private

  def vote_relationship_params
    params.require(:vote_relationship).permit(:user_id, :vote_id)
  end
end
