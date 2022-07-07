class AddAttributesToBar < ActiveRecord::Migration[5.2]
  def change
    add_column :bars, :specials, :boolean
    add_column :bars, :established, :integer
    add_column :bars, :location, :string
  end
end
