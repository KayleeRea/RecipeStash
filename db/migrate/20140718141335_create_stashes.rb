class CreateStashes < ActiveRecord::Migration
  def change
    create_table :stashes do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :photo_url
      t.string :yummly_id

      t.timestamps
    end
  end
end
