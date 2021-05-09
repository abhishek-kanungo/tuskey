class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.datetime :reminder1
      t.string :reminder2
      t.string :datetime
      t.boolean :reminder1_sent
      t.boolean :reminder2_sent
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
