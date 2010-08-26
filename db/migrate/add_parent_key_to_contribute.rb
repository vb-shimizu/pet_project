class AddFileNameFileSizeToContribute < ActiveRecord::Migration
  def self.up
    add_column :contributes, :parent_key, :string
  end

  def self.down
    remove_column :contributes, :parent_key
  end
end
