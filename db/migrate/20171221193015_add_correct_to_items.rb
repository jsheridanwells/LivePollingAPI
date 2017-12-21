class AddCorrectToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :correct, :boolean, default: false
  end
end
