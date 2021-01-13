class UsersController < ApplicationController
  before_action :set_user, only: [:profile_create, :update, :delete_avater, :stock]
  skip_before_action :noname_user, only: [:profile_create, :update]

  def show
    @user = User.find(params[:id])
    @user_consultations = Kaminari.paginate_array(@user.consultations.recently).page(params[:page]).per(5)
    @c = Consultation.joins(:consultation_comments).where(consultation_comments: { user: User.find(@user.id) })
    @comments = ConsultationComment.joins(:consultation_comment_replies).where(consultation_comment_replies: { user: User.find(@user.id) })
    @c += Consultation.joins(:consultation_comments).where(consultation_comments: @comments).recently
    @user_comments = Kaminari.paginate_array(@c.uniq).page(params[:page]).per(5)
    @user_votes =  Kaminari.paginate_array(@user.votes.recently).page(params[:page]).per(5)
    @p = VoteItem.joins(:vote_relationships).where(vote_relationships: { user: User.find(@user.id) })
    @user_poll =  Kaminari.paginate_array(Vote.where(id: @p.pluck(:vote_id)).recently).page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def profile_create
    @children = @user.children.build
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールを登録しました。'
    else
      flash.now[:alert] = '必須項目を入力願います。'
      render :profile_create
    end
  end

  def delete_avater
    @user.remove_avatar!
    @user.save
    redirect_to edit_user_registration_path(@user), notice: 'プロフィール画像を削除しました。'
  end

  def stock
    @consultation_stocks =  Kaminari.paginate_array(@user.stocked_consultations).page(params[:page_1]).per(5)
    @vote_stocks =  Kaminari.paginate_array(@user.stocked_votes).page(params[:page_2]).per(5)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar, children_attributes: [:nick_name, :birthday, :child_number])
  end

  def set_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user
  end
end
