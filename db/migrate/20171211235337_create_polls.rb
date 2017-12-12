class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :content
      t.references :presentation, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
