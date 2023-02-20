class BinaryDoc < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :doc,:binary
  end
end
