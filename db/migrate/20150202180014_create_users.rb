class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.integer :zipcode
      t.string :gender
      t.text :bio

      t.timestamps
    end
  end
end
