class AddCleanerToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :cleaner, :boolean
  end
end
