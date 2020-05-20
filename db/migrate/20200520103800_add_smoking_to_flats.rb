class AddSmokingToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :smoking, :boolean
  end
end
