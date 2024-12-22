class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.references :user, null: false, foreign_key: true 
      t.date :entry_date, null: false                                       
      t.text :content, null: false
                            
      t.timestamps
    end
  end
end
