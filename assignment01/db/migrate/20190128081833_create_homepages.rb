class CreateHomepages < ActiveRecord::Migration[5.2]
  def change
    create_table :homepages do |t|
      t.string :name
      t.string :lastname
      t.integer :studentid
      t.string :major

      t.timestamps
    end
  end
end
