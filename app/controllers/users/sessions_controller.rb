# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: :create
    skip_before_action :noname_user, only: :destroy

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    def new_guest
      user = User.find_or_create_by!(email: 'guest@example.com') do |u|
        u.password = SecureRandom.urlsafe_base64
        u.name = 'ゲストユーザー'
        u.introduction = 'よろしくおねがいします。'
      end

      Child.find_or_create_by!(user_id: user.id) do |c|
        c.child_number = 1
        c.nick_name = 'たろう'
        c.birthday = '2020-1-1'
      end

      sign_in user
      redirect_to user, notice: 'ゲストユーザーとしてログインしました。'
    end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end

    def after_sign_in_path_for(resource)
      user_path(resource)
    end
  end
end
