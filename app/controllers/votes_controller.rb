class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :destroy]
  before_action :redirect_root, only: [:destroy]

  impressionist actions: [:show]

  def new
    @vote = Vote.new
    @vote_item = @vote.vote_items.build
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.child_age_moon_age = @vote.age.to_i * 12 + @vote.moon_age.to_i
    @vote.closed_at = Date.today + @vote.days.to_i unless @vote.days.empty?
    if @vote.save
      redirect_to @vote, notice: '投稿しました。'
    else
      render :new
    end
  end

  def show
    store_location
    @stock = VoteStock.new
    impressionist(@vote, nil, unique: [:session_hash])
    @vote_relationship = VoteRelationship.new
    @comment = VoteComment.new
    @comments = @vote.vote_comments.recently.page(params[:page]).per(20)
    @data = @vote.vote_items.map { |item| [item.item, item.vote_relationships.count] }.to_h
  end

  def index
    store_location
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @vote.destroy
    redirect_to root_path, notice: '削除しました'
  end

  private

  def vote_params
    params.require(:vote).permit(:content, :title, :category_id, :age, :moon_age, :pregnant, :closed_at, { image: [] }, :days, vote_items_attributes: [:item, :item_number]).merge(user_id: current_user.id)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def redirect_root
    redirect_to(root_url) unless current_user.id == @vote.user_id
  end
end
