class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :category
      t.text :description
      t.boolean :requires_wand

      t.timestamps
    end
  end
end
