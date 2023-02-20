class AddedCorrectedInvoiceColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :invoice_id,:integer
  end
end
