class Playlists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.string :title
      t.string :song
      t.string :artist
      t.belongs_to :user
    end
  end
end
