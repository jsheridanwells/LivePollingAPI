class AddFeedbackTypeToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :feedback_type, :integer, default: 1
  end
end
