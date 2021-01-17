class ApplicationController < ActionController::Base
  before_action :store_current_location, unless: :devise_controller?
  before_action :noname_user
  before_action :set_search
  before_action :set_category

  def set_search
    @model1 = Consultation.ransack(params[:model1], search_key: :model1)
    @model1.sorts = 'updated_at desc' if @model1.sorts.empty?
    @search_consultations = Kaminari.paginate_array(@model1.result).page(params[:page]).per(5)
    @model2 = Vote.search(params[:model2], search_key: :model2)
    @model2.sorts = 'updated_at desc' if @model2.sorts.empty?
    @search_votes = Kaminari.paginate_array(@model2.result).page(params[:page]).per(5)
  end

  def set_category
    @categories = Category.all
  end

  def noname_user
    if user_signed_in? && !current_user.name
      redirect_to profile_create_path(current_user)
      flash[:alert] = 'お名前を登録願います。'
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  private

  def store_current_location
    return if current_user

    store_location_for(:user, request.url)
  end
end
