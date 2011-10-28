class CreateChapters < ActiveRecord::Migration
  def self.up
    create_table :chapters do |t|
      t.string :name
      t.integer :number
      t.integer :book_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chapters
  end
end
