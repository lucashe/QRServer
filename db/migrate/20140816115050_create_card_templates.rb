class CreateCardTemplates < ActiveRecord::Migration
  def change
    create_table :card_templates do |t|

      t.string :title
      t.string :desc
      t.string :frontImageURL
      t.string :backImageURL

      t.timestamps
    end
  end
end
