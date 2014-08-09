ActiveAdmin.register Merchant do
  permit_params :name,:desc,:addrLine1,:addrLine2,:postCode,:phone,:logoURL,:bannerURL

  show do |ad|
    attributes_table do
      row :name
      row :desc
      row :logo do
        image_tag(ad.logoURL.url)
      end
    end
    active_admin_comments
  end

  form do |f|

    f.inputs "Edit merchant", :multipart => true do

      f.input :name
      f.input :desc
      f.input :logo, :as => :file, :hint => f.template.image_tag(f.object.logoURL.url)

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
