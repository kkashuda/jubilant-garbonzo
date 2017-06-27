class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.string :title
      t.string :description 
      t.string :link
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true 
      t.timestamps
    end
  end
end
