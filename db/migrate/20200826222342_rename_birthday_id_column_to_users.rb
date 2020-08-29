class RenameBirthdayIdColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :birthday_id, :birthday
  end
end