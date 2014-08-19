ActiveAdmin.register CardTemplate do

  permit_params :title,:desc,:frontImageURL,:backImageURL

  show do |ad|
    attributes_table do
      row :Card_Title do ad.title end
      row :Card_Description do ad.desc end
      row :Front_Image do
        image_tag(ad.frontImageURL.url)
      end
      row :Back_Image  do
        image_tag(ad.backImageURL.url)
      end
    end
    active_admin_comments
  end

  form do |f|

    f.inputs "Edit Card Template", :multipart => true do

      f.input :title, :label => "Card Title"
      f.input :desc, :label => "Card Description"
      f.input :frontImageURL, :as => :file, :hint => f.template.image_tag(f.object.frontImageURL.url), :label => "Front Image"
      f.input :backImageURL, :as => :file, :hint => f.template.image_tag(f.object.backImageURL.url), :label => "Back Image"

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
