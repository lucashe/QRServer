class ModifyCard < ActiveRecord::Migration
  def change

    remove_column :cards, :QRCode
    remove_column :cards, :barCode
    add_column :cards, :code, :string
    add_column :cards, :codeFormat, :string

  end
end
