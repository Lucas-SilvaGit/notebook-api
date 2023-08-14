class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.string :phone_number
      t.string :group

      t.timestamps
    end
  end
end
