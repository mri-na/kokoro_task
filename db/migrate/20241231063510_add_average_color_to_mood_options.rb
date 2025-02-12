class AddAverageColorToMoodOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :mood_options, :average_color, :string
  end
end
