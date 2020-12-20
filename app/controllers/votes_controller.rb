class VotesController < ApplicationController
  def new
    @vote = Vote.new
    @vote_item = @vote.vote_items.build
  end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to @vote, notice: '投稿しました。'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @vote = Vote.find(params[:id])
    @category = Category.find_by(id: @vote.category_id)
  end

  def destroy
    @vote.destroy
    redirect_to root_path, notice: '削除しました'
  end

  private

  def vote_params
    params.require(:vote).permit(:content, :title, :user_id, :category_id, :child_age, :child_moon_age, :pregnant, { image: [] }, vote_items_attributes: [:item, :item_number, :vote_id])
  end
end
