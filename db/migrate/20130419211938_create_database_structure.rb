class CreateDatabaseStructure < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :name,               null: false, default: "", limit: 250
      t.string :email,              null: false, default: "", limit: 255
      t.boolean :admin,             default: false
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
    
    
    create_table(:releases) do |t|
      t.string :title,          null: false, default: "", limit: 60
      t.string :contact,        null: false, default: "", limit: 250
      t.string :backup_contact, null: false, default: "", limit: 250
      t.date :release_date
      t.date :code_cutoff_date
      t.string :modified_by,    null: false, default: "", limit: 250
      t.boolean :archive,       default: false
      
      t.timestamps
    end
    
    add_index :releases, :title
    
    
    create_table(:release_data) do |t|
      t.string :section,    null: false, default: "", limit: 50
      t.string :label,      null: false, default: "", limit: 1000
      t.integer :priority,  default: 0, null: false
      t.boolean :priority,  default: true, null: false
    end
    
    
    create_table(:checklist_tools) do |t|
      t.integer :release_id,      null: false, default: 0
      t.integer :release_data_id, null: false, default: 0
      t.boolean :value,           null: false, default: false
      t.string :modified_by,      null: false, default: "", limit: 250
      
      t.timestamps
    end
    
    
    create_table(:checklist_items) do |t|
      t.integer :release_id,      null: false, default: 0
      t.integer :release_data_id, null: false, default: 0
      t.string :environment,      null: false, default: "", limit: 50
      t.boolean :value,           null: false, default: false
      t.boolean :applicable,      null: false, default: true
      t.string :modified_by,      null: false, default: "", limit: 250
      
      t.timestamps
    end
    
    
    create_table(:comments) do |t|
      t.integer :release_id,          default: 0,  null: false
      t.integer :checklist_item_id,   default: 0,  null: false
      t.string :checklist_item_type,  null: false, default: "", limit: 250
      t.string :comment,              null: false, default: "", limit: 20000
      t.string :author,               null: false, default: "", limit: 500
      t.string :modified_by,          null: false, default: "", limit: 250
      
      t.timestamps
    end
    
    
    create_table(:affected_browsers_data) do |t|
      t.string :browser,    null: false, default: "", limit: 250
      t.string :label,      null: false, default: "", limit: 250
      t.integer :priority,  default: 0, null: false
      t.boolean :active,    default: true
    end
    
    
    create_table(:affected_designs_data) do |t|
      t.string :category, null: false, default: "", limit: 250
      t.string :design,   null: false, default: "", limit: 250
      t.string :label,    null: false, default: "", limit: 250
      t.boolean :active,  default: true
    end
    
    
    create_table(:release_items) do |t|
      t.integer :release_id,        null: false, default: 0
      t.string :item_type,          null: false, default: "", limit: 250
      t.string :source,             null: false, default: "", limit: 250
      t.string :source_reference,   null: false, default: "", limit: 250
      t.string :title,              null: false, default: "", limit: 500
      t.boolean :is_config_change,  default: false
      t.boolean :is_data_change,    default: false
      t.string :affected_browsers,  null: false, default: "", limit: 9000
      t.string :affected_designs,   null: false, default: "", limit: 9000
      t.string :affected_product,   null: false, default: "", limit: 250
      t.integer :level_of_comfort,  null: false, default: 0
      t.integer :level_of_risk,     null: false, default: 0
      t.string :comments,           null: false, default: "", limit: 1000
      t.string :modified_by,        null: false, default: "", limit: 250
      
      t.timestamps
    end
    
    
    add_column :users, :show_timestamps, :boolean, after: :email, null: false, default: false
  end
end
