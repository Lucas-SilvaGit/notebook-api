class RemovePhoneNumberFromContact < ActiveRecord::Migration[6.1]
  def change
    remove_column :contacts, :phone_number, :string
  end
end
