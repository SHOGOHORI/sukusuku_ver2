class HomePagesController < ApplicationController
  skip_before_action :store_current_location
  before_action :delete_url

  def home
    @consultations = Consultation.all.recently.page(params[:page_1]).per(5)
    @votes = Vote.all.recently.page(params[:page_2]).per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def help
  end

  def privacy
  end

  private

  def delete_url
    session.delete(:forwarding_url)
  end
end
