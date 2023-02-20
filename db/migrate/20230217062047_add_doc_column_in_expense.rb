class AddDocColumnInExpense < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :doc,:string
  end
end
