class AddColumnToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :credit, :integer
    add_column :courses, :room, :string
    add_column :courses, :midterm, :integer
    add_column :courses, :final, :integer
    add_column :courses, :assignment, :integer
    add_column :courses, :project, :integer
  end
end
