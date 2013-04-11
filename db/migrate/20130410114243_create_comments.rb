class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |c|
      c.string :content
      c.integer :parent_id
      c.integer :post_id
      c.integer :user_id
      c.timestamps
    end
  end
end
