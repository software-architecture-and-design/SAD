class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :topic
      t.text :description

      t.timestamps
    end
  end
end
