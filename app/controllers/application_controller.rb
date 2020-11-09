class ApplicationController < ActionController::Base
  # before_action :non_username


  def non_username
    if user_signed_in?
      redirect_to profile_create_path(current_user) if current_user.name == nil
      flash[:alert] = 'お名前を登録願います。'
    end
  end
end
