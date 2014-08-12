ActiveAdmin.register Merchant do
  permit_params :name,:desc,:addrLine1,:addrLine2,:postCode,:phone,:logoURL,:bannerURL

  show do |ad|
    attributes_table do
      row :Merchant_Name do ad.name end
      row :Merchant_Description do ad.desc end
      row :Address_Line_1 do ad.addrLine1 end
      row :Address_Line_2 do ad.addrLine2 end
      row :Postal_Code do ad.postCode end
      row :Phone do ad.phone end

      row :Logo do
        image_tag(ad.logoURL.url)
      end
    end
    active_admin_comments
  end

  form do |f|

    f.inputs "Edit merchant", :multipart => true do

      f.input :name, :label => "Merchant Name"
      f.input :desc, :label => "Merchant Description"
      f.input :addrLine1, :label => "Address Line 1"
      f.input :addrLine2, :label => "Address Line 2"
      f.input :postCode, :label => "Postal Code"
      f.input :phone, :label => "Phone"
      f.input :logoURL, :as => :file, :hint => f.template.image_tag(f.object.logoURL.url), :label => "Logo"

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
