class VoteRelationshipsController < ApplicationController
  def create
    @form = Form::ItemCollection.new(vote_relationship_params)
    if @form.save
      redirect_to @form.vote_item.vote, notice: '投票しました。'
    else
      flash[:alert] = '投票に失敗しました'
      redirect_to request.referer
    end
  end

  private

  def vote_relationship_params
    params.require(:form_item_collection).permit(vote_relationships_attributes: [:user_id, :vote_item_id])
  end
end
