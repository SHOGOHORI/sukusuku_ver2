ActiveAdmin.register Vote do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :content, :image, :pregnant, :user_id, :category_id, :child_age_moon_age, :closed_at, :impressions_count
  #
  # or
  #
  permit_params do
    permitted = [:title, :content, :image, :pregnant, :user_id, :category_id, :child_age_moon_age, :closed_at, :impressions_count]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

end
