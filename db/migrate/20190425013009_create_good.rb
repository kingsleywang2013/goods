class CreateGood < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :consignment_id, null: false, index: true
      t.string :type, null: false, index: true
      t.string :name, null: false, index: true
      t.string :source
      t.string :destination
      t.datetime :entry_at
      t.datetime :exit_at
      t.timestamps
    end
  end
end
