class ApplicationController < ActionController::Base
  before_action :noname_user

  def noname_user
    if user_signed_in? && !current_user.name
      redirect_to profile_create_path(current_user)
      flash[:alert] = 'お名前を登録願います。'
    end
  end
end
