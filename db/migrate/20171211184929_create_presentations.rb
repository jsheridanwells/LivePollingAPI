class CreatePresentations < ActiveRecord::Migration[5.1]
  def change
    create_table :presentations do |t|
      t.references :user, foreign_key: true, on_delete: :cascade
      t.string :title

      t.timestamps
    end
  end
end
