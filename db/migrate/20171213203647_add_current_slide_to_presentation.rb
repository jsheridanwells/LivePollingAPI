class AddCurrentSlideToPresentation < ActiveRecord::Migration[5.1]
  def change
    add_column :presentations, :current_slide, :integer, :default => 0
  end
end
