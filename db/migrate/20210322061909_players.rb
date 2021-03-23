class Players < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :nationality
      t.integer :pace
      t.integer :physical
      t.integer :shooting
      t.integer :defending
      t.integer :passing
      t.integer :dribbling
      t.string :nickname
      t.belongs_to :user
    end
  end
end
