class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|

      t.string :name
      t.string :desc
      t.string :addrLine1
      t.string :addrLine2
      t.integer :postCode
      t.integer :phone

      t.string :logoURL
      t.string :bannerURL

      t.timestamps

    end
  end
end
