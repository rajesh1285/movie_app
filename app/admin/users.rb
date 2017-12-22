ActiveAdmin.register User do

	

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
 permit_params :email, :name, :password, :password_confirmation,:image
  decorate_with UserDecorator
  index do
    selectable_column
    id_column
    column :email
    column :image 
    column :name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

end
