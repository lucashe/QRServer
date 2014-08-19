class AddCardTemplateIdToCards < ActiveRecord::Migration
  def change
    add_column  :cards, :card_template_id, :integer
  end
end
