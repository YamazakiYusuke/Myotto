class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, default: '不明'
      t.datetime :issued_date
      t.integer :level, default: 0
      t.integer :language, null: false, default: 0
      # t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
