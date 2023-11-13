class CreateUserEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :user_events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
