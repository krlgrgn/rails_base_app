class InitialMigration < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :session_token
      t.string :uid
      t.string :provider
      t.string :image
      t.string :location
      t.string :oauth_token
      t.string :gender
      t.boolean :signup_complete, default: false
      t.timestamp :date_of_birth
      t.timestamp :oauth_expires_at

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ''

      t.timestamps null: false

      t.index :email, unique: true
      t.index [:provider, :uid], unique: true
    end

    create_table :roles do |t|
      t.string :name
    end

    create_table :user_role_mappings do |t|
      t.integer :user_id
      t.integer :role_id
      t.index [:user_id, :role_id]
      t.index [:role_id, :user_id]
      t.timestamps null: false
    end
  end
end
