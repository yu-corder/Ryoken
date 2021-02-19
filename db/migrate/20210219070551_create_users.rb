class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :nickname, unique: true
      t.integer :account_id, unique: true
      t.text :profile

      t.timestamps
    end

  end
end
