class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.datetime :start_date_time
      t.text :detail
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
