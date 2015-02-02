class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :age
      t.string :size
      t.string :play
      t.string :gender
      t.string :personality
      t.text :bio
    end
  end
end
