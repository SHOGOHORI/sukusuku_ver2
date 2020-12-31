class HomePagesController < ApplicationController
  skip_before_action :store_current_location

  def home
    @consultations = Consultation.all.recently.page(params[:consultation_page]).per(5)
    @votes = Vote.all.recently.page(params[:vote_page]).per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def help
  end

  def privacy
  end
end
