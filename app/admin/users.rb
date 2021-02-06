ActiveAdmin.register User do
  permit_params do
    permitted = [:email, :encrypted_password, :remember_created_at, :name, :introduction, :avatar, :admin]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
end
