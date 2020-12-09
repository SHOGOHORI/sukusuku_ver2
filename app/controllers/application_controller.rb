class ApplicationController < ActionController::Base
  before_action :noname_user
  before_action :store_user_location!, if: :storable_location?

  def noname_user
    if user_signed_in? && !current_user.name
      redirect_to profile_create_path(current_user)
      flash[:alert] = 'お名前を登録願います。'
    end
  end

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def after_sign_out_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
end
