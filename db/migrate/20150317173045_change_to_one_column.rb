class ChangeToOneColumn < ActiveRecord::Migration
  def change
    remove_column :filters, :breed
    remove_column :filters, :size
    remove_column :filters, :age
    remove_column :filters, :personality
    remove_column :filters, :play
    remove_column :filters, :blocked_user_id
    remove_column :filters, :gender
    remove_column :filters, :location
  end
end
