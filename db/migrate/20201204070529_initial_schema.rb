class InitialSchema < ActiveRecord::Migration[5.2]

  def up
    create_table :users do |t|
      t.string :name,               null: false
      t.string :profile
      t.string :icon
      t.string :email,              null: false
      t.string :password_digest
      t.boolean :admin, default: false
      t.timestamps
    end

    add_index :users, :email, unique: true

    create_table :books do |t|
      t.string :title, null: false
      t.string :image
      t.string :author
      t.datetime :issued_date
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :sentences do |t|
      t.text :content, null: false
      t.references :book, foreign_key: true

      t.timestamps
    end

    create_table :user_book_favorites do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end

    add_index :user_book_favorites, [:user_id, :book_id], unique: true

    create_table :locales do |t|
      t.string :name, unique: true
      
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
      t.boolean :is_main, null: false
      t.string :difficulty
      
      t.timestamps
    end

    create_table :translations do |t|
      t.references :user, foreign_key: true
      t.references :sentence, foreign_key: true
      t.text :content
      t.string :book_locale, null: false
      t.string :user_locale, null: false

      t.timestamps
    end

    add_index :translations, :book_locale
    add_index :translations, :user_locale

    create_table :user_translation_favorites do |t|
      t.references :translation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :user_translation_favorites, [:translation_id, :user_id], unique: true

    create_table :user_translation_comments do |t|
      t.references :translation, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content, null: false

      t.timestamps
    end

    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.timestamps
    end

    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true

    create_table :dm_pairs do |t|
      t.integer :sender_id
      t.integer :recipient_id
      
      t.timestamps
    end
    add_index :dm_pairs, :sender_id
    add_index :dm_pairs, :recipient_id
    add_index :dm_pairs, [:sender_id, :recipient_id], unique: true

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