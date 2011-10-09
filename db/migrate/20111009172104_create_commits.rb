class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
