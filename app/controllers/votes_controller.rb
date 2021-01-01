class VotesController < ApplicationController
  impressionist actions: [:show]

  def new
    @vote = Vote.new
    @vote_item = @vote.vote_items.build
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.child_age_moon_age = @vote.age.to_i * 12 + @vote.moon_age.to_i
    @vote.closed_at = Date.today + @vote.days.to_i
    if @vote.save
      redirect_to @vote, notice: '投稿しました。'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    store_location
    @vote = Vote.find(params[:id])
    impressionist(@vote, nil, unique: [:session_hash])
    @vote_relationship = VoteRelationship.new
    @comment = VoteComment.new
    @comments = @vote.vote_comments.recently.page(params[:page]).per(5)
    @data = @vote.vote_items.group(:item)
  end

  def destroy
    @vote.destroy
    redirect_to root_path, notice: '削除しました'
  end

  private

  def vote_params
    params.require(:vote).permit(:content, :title, :user_id, :category_id, :age, :moon_age, :pregnant, { image: [] }, :days, vote_items_attributes: [:item, :item_number])
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
