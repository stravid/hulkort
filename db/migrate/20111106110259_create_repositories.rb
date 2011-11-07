class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name, :null => false
      t.string :shortcode
      t.integer :user_id

      t.timestamps
    end

    add_index :repositories, :shortcode, :unique => true
    add_index :repositories, [:name, :user_id], :unique => true
  end
end
