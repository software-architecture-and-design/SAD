class AddTypeToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :aasm_state, :string
  end
end
