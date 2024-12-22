class CreateMoodOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :mood_options do |t|
      t.references :optionable, polymorphic: true, null: false
      t.json :colors, null: false
      t.json :labels, null: false

      t.timestamps
    end
  end
end