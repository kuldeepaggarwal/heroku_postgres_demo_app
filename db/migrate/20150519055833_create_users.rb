class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :twitter_id
      t.string :token
      t.string :secret
      t.string :email

      t.timestamps null: false
    end
  end
end
