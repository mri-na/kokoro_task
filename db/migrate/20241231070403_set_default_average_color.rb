class SetDefaultAverageColor < ActiveRecord::Migration[7.0]
  def up
    MoodOption.where(average_color: nil).update_all(average_color: "#ffffff")
  end

  def down
    MoodOption.where(average_color: "#ffffff").update_all(average_color: nil)
  end
end
