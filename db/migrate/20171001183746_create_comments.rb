class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :comment_body
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps null: false
    end

    add_index :comments, [:commentable_type, :commentable_id]
  end
end
