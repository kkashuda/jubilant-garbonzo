class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
    	t.string :title 
    	t.text :content 
    	t.string :username
    	t.belongs_to :pin, index: true
    end
  end
end
