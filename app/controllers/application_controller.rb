class ApplicationController < ActionController::Base
  before_action :store_current_location, unless: :devise_controller?
  before_action :noname_user
  before_action :set_search
  before_action :set_category

  def set_search
    @q = Consultation.ransack(params[:q])
    @q.sorts = 'updated_at desc' if @q.sorts.empty?
    @search_consultations = Kaminari.paginate_array(@q.result).page(params[:page]).per(5)
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

  def search_option
    params[:q][:child_age_moon_age_lteq] = params[:q][:age_lteq].to_i * 12 + params[:q][:moon_age_lteq].to_i
    params[:q][:child_age_moon_age_gteq] = params[:q][:age_gteq].to_i * 12 + params[:q][:moon_age_gteq].to_i
  end
end
