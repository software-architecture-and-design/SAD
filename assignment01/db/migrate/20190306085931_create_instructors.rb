class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :office_room
      t.string :department
      t.string :school

      t.timestamps
    end
  end
end
