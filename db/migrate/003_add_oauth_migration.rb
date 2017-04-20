class AddOauthMigration < ActiveRecord::Migration
  def self.up

	  # Required columns: :key & :secret
	  create_table :applications do |t|
	    t.string :name
	    t.string :key
	    t.string :secret

	    t.timestamps null: false
	  end

	  add_index :applications, :key, unique: true

	  # Required columns: :client_id, :resource_owner_id, :token, :expires_at, :revoked_at, :refresh_token
	  create_table :access_tokens do |t|
	    t.integer :resource_owner_id
	    t.integer :client_id

	    t.string :token, null: false
	    t.string :refresh_token
	    t.string :scopes, default: ''

	    t.datetime :expires_at
	    t.datetime :revoked_at
	    t.datetime :created_at, null: false
	  end

	  add_index :access_tokens, :token, unique: true
	  add_index :access_tokens, :resource_owner_id
	  add_index :access_tokens, :client_id
	  add_index :access_tokens, :refresh_token, unique: true
  end

  def self.down
  	drop_table :applications
  	drop_table :access_tokens
  end
end
