class AddWrittenToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :written, :text
  end
end
