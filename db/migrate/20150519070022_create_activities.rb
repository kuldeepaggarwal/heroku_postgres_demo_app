class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :entity_ids, array: true, default: []
      t.string :entity_type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
