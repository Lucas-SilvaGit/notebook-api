class RemoveFieldGroupFromContact < ActiveRecord::Migration[6.1]
  def change
    remove_column :contacts, :group, :string
  end
end
