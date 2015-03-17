class AddContentColumnToMigration < ActiveRecord::Migration
  def change
    add_column :filters, :content, :string
  end
end
