class CreatePostvotes < ActiveRecord::Migration
  def change
      create_table :postvotes do |p|
      p.references :user
      p.references :post
      p.timestamps
    end
  end
end
