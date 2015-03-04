class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :type
      t.string :breed
      t.string :size
      t.string :age
      t.string :personality
      t.string :play
      t.integer :blocked_user_id
      t.integer :user_id
      t.timestamps
    end
  end
end
