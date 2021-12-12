# frozen_string_literal: true

class DeviseCreateBuilders < ActiveRecord::Migration[6.0]
  def change
    create_table :builders do |t|
      ## Database authenticatable
      t.string :brand_name,         null: false
      t.string :builder_email,      null: false, default: ""
      t.string :builder_password,   null: false, default: ""
      t.string :area,               null: false
      t.string :city,               null: false
      t.text :introduce,            null: false
      t.string :price_zone,         null: false
      t.integer :phone,             null: false
      t.integer :private_order_id,  null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :builders, :builder_email,                unique: true
    add_index :builders, :reset_password_token, unique: true
    # add_index :builders, :confirmation_token,   unique: true
    # add_index :builders, :unlock_token,         unique: true
  end
end
