class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :content
      t.references :poll, foreign_key: true

      t.timestamps
    end
  end
end
