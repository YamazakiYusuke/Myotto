class InitialSchema < ActiveRecord::Migration[5.2]

  def up
    create_table :users do |t|
      ## Database authenticatable
      t.string :name,               null: false
      t.string :profile
      t.string :icon
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.boolean :admin, default: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true

    create_table :books do |t|
      t.string :title, null: false
      t.string :author, default: '不明'
      t.datetime :issued_date
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :sentences do |t|
      t.text :content, null: false
      t.references :book, foreign_key: true

      t.timestamps
    end

    create_table :user_book_favarites do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end

    create_table :locales do |t|
      t.string :name
      
      t.timestamps
    end

    create_table :user_locale_statuses do |t|
      t.references :user, foreign_key: true
      t.references :locale, foreign_key: true
      t.boolean :is_native
      t.boolean :is_wanted
      t.string :wanted_level

      t.timestamps
    end

    create_table :book_locale_statuses do |t|
      t.references :book, foreign_key: true
      t.references :locale, foreign_key: true
      t.boolean :is_main
      t.string :difficulty
      
      t.timestamps
    end

    create_table :translations do |t|
      t.references :user, foreign_key: true
      t.references :sentence, foreign_key: true
      t.text :content

      t.timestamps
    end

    create_table :user_translation_favarites do |t|
      t.references :translation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :user_translation_comments do |t|
      t.references :translation, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content, null: false

      t.timestamps
    end

    create_table :relationships do |t|
      t.references :follower_id, foreign_key: { to_table: :users }
      t.references :followed_id, foreign_key: { to_table: :users }

      t.timestamps
    end

    create_table :dm_pairs do |t|
      t.references :sender_id, foreign_key: { to_table: :users }
      t.references :recipient_id, foreign_key: { to_table: :users }
      
      t.timestamps
    end

    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.references :dm_pair, foreign_key: true
      t.string :content
      t.string :image

      t.timestamps
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, 'The initial migration is not revertable'
  end
end

