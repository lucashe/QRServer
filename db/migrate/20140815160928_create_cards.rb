class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|

      t.integer :user_id
      t.string :number
      t.string :barCode
      t.string :QRCode
      t.date :expiryDate

      t.timestamps
    end
  end
end
