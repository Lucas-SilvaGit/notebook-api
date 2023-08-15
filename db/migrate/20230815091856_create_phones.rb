class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :phone_number
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
