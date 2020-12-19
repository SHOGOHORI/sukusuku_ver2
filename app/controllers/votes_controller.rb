class VotesController < ApplicationController
  def new
    @vote = Vote.new
    @vote_item = @vote.vote_items.build
  end

  def create
    # Vote.create!(vote_params)
    @vote = Vote.new(vote_params)
    # pry.building
    if @vote.save
      redirect_to root_path, notice: '投稿しました。'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

  def vote_params
    params.require(:vote).permit(:content, :title, :user_id, :category_id, :child_age, :child_moon_age, :pregnant, { image: [] })#, vote_items_attributes: [:id, :item, :item_number, :_destroy])
  end
end
