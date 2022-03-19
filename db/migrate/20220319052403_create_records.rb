class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :content, null: false
      t.integer :bug_status, limit: 1, null: false, default: 0
      t.references :user, foreign_key: true
      t.references :goal, foreign_key: true
      t.timestamps
    end
  end
end
