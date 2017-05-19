class RemoveLinkFromPins < ActiveRecord::Migration[5.0]
  def change
    remove_column :pins, :link, :string
  end
end
