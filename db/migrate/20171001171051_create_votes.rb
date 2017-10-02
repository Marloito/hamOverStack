class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :value
      t.belongs_to :answer
      t.belongs_to :question

      t.timestamps
    end
  end
end
