class AddLinkToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :link, :string
  end
end
