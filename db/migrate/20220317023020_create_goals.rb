class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :title
      t.date :due_day
      t.integer :status, limit: 1, null: false, default: 0
      t.references :user, foreign_key: true
      t.references :kind, foreign_key: true
      t.timestamps
    end
  end
end
