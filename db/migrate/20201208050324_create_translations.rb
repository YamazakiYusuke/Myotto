class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :sentence, foreign_key: true

      t.timestamps
    end
  end
end
