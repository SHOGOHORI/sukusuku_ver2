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

  def search
    keyword = params[:keyword]
    category = params[:category]
    @c = Consultation.ransack(content_or_title_cont: keyword, category_id_eq: category)
    @consultations_result = Kaminari.paginate_array(@c.result).page(params[:page_1]).per(5)
    @v = Vote.ransack(content_or_title_cont: keyword, category_id_eq: category)
    @votes_result = Kaminari.paginate_array(@v.result).page(params[:page_2]).per(5)
  end

  private

  def delete_url
    session.delete(:forwarding_url)
  end
end
