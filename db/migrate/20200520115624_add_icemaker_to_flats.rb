class AddIcemakerToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :icemaker, :boolean
  end
end
