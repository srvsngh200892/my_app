class CreateObjectStates < ActiveRecord::Migration
  def change
    create_table :object_states do |t|
      t.integer :object_id, null: false
      t.string :object_type, null: false
      t.jsonb  :object_changes, default: {}, null: false
      t.bigint :timestamp, null: false
      t.timestamps
    end
    add_index :object_states, :object_changes, using: :gin
  end
end
