class AddLocationToFilters < ActiveRecord::Migration
  def change
    add_column :filters, :location, :string
  end
end
