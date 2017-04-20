class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :users
  end
end
