class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |p|
      p.string :title, :body, :url
      p.integer :user_id
      p.timestamps
    end
  end
end
