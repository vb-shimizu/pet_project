class AddFileNameFileSizeToContribute < ActiveRecord::Migration
  def self.up
    add_column :contributes, :file_name, :string
    add_column :contributes, :file_size, :integer
  end

  def self.down
    remove_column :contributes, :file_size
    remove_column :contributes, :file_name
  end
end
