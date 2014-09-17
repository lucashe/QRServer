ActiveAdmin.register Card do

  permit_params :user_id,:card_template_id,:number

  index do
    selectable_column
    column :user_id
    column :card_template_id
    column :number
    column :created_at
    column :updated_at

    actions
  end

  show do |ad|
    attributes_table do
      row :User_ID do ad.user_id end
      row :Card_Template_ID do ad.card_template_id end
      row :Card_Number do ad.number end
    end
    active_admin_comments
  end

  form do |f|

    f.inputs "Edit Card", :multipart => true do

      f.input :user_id, :label => "User ID"
      f.input :card_template_id, :label => "Card Template ID"
      f.input :number, :label => "Card Number"

    end

    f.actions

  end

# See permitted parameters documentation:
# https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#  permitted = [:permitted, :attributes]
#  permitted << :other if resource.something?
#  permitted
# end

end
