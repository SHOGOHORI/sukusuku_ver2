class VoteRelationshipsController < ApplicationController
  def create
    @form = VoteRelationships.new(vote_relationship_params)
    if @form.save
      redirect_to request.referer, notice: '投票しました。'
    else
      flash[:alert] = '投票に失敗しました'
      redirect_to request.referer
    end
  end

  private

  def vote_relationship_params
    params.require(:vote_relationship).permit(user_id, :vote_item_id)
  end
end
