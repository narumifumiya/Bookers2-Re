class RenameBodyColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :Body, :body
  end
end
