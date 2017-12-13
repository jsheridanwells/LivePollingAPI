class AddBroadcastingToPresentations < ActiveRecord::Migration[5.1]
  def change
    add_column :presentations, :broadcasting, :boolean, :default => false
  end
end
