class AddSpeakersToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :speakers, :boolean
  end
end
