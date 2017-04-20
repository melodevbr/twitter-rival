class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
    	t.string :text, null: false
    	t.references :user, null: false
      
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :messages
  end
end
