class AddResponseTypeToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :response_type, :integer, default: 1
  end
end
