class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false, limit: 100
      t.string :author, default: '不明', limit: 100
      t.datetime :issued_date
      t.integer :level, default: 0, limit: 2
      t.integer :language, null: false, default: 0, limit: 2
      # t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
