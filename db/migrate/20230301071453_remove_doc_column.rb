class RemoveDocColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column:expenses,:doc,:binary
  end
end
