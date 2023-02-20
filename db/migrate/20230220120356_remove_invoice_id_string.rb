class RemoveInvoiceIdString < ActiveRecord::Migration[7.0]
  def change
    remove_column:expenses,:invoice_id,:string
  end
end
