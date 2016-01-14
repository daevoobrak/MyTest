class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :like
      t.text :dislike
      t.references :comment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
