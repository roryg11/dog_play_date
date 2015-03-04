class AddGenderToFilters < ActiveRecord::Migration
  def change
    add_column :filters, :gender, :string
  end
end
