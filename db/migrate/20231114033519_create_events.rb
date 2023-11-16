class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.integer :duration
      t.string :location_name
      t.string :location_coordinates
      t.string :tags
      t.integer :status

      t.timestamps
    end
  end
end
