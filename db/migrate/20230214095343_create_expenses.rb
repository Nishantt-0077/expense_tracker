class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.integer :u_id
      t.string :invoice_id
      t.string :date
      t.string :desc
      t.integer :amount

      t.timestamps
    end
  end
end
