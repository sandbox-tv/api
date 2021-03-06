class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :expires
      t.string :uuid
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
