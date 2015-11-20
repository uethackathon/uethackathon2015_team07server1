class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :day_month
      t.string :year
      t.text :content
      t.boolean :main_event

      t.timestamps null: false
    end
  end
end
