class UsersController < ApplicationController
  before_action :set_user, only: [:profile_create, :update]

  def show
    @user = User.find(params[:id])
  end

  def profile_create
    @user.children.build
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールを登録しました。'
    else
      render :profile_create, alert: '必須項目を入力願います。'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :introduction, books_attributes: [:nick_name, :birthday, :child_number])
    end

    # def child_collection_params
    #   params
    #     .require(:form_child_collection)
    #     .permit(children_attributes: :user_id)
    #   end
    # end

    def set_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user == @user
    end
end
