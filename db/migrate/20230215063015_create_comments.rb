class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :user_name
      t.string :desc

      t.timestamps
    end
  end
end
