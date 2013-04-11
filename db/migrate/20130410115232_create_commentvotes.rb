class CreateCommentvotes < ActiveRecord::Migration
  def change
    create_table :commentvotes do |c|
      c.references :user
      c.references :comment
      c.timestamps
    end
  end
end
