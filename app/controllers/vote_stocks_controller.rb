class VoteStocksController < ApplicationController

  def create
    @vote = Vote.find(params[:vote_id])
    @stock = current_user.vote_stocks.create(vote_id: params[:vote_id])
    respond_to do |format|
      format.html {redirect_to @vote }
      format.js
    end
  end

  def destroy
    @vote = Vote.find(params[:vote_id])
    @stock= VoteStock.find_by(vote_id: params[:vote_id], user_id: current_user.id)
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to @vote }
      format.js
    end
  end
end
