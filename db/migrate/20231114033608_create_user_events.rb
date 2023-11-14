class CreateUserEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :user_events do |t|
      t.integer :role
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end

    add_index :user_events, [:user_id, :event_id], unique: true
  end
end
