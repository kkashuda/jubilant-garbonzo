class AddTimestampsToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :created_at, :datetime
  end
end
