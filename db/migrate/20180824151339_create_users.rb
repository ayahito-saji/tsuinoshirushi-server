class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name,         null: false
      t.string :access_key,   null: false
      t.integer :level,       null: false, default: 1
      t.integer :gold,        null: false, default: 0
      t.integer :exp,         null: false, default: 0
      t.text :position_logs

      t.timestamps
    end
  end
end
