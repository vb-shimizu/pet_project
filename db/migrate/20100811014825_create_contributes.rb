class CreateContributes < ActiveRecord::Migration
  def self.up
    create_table :contributes do |t|
      t.primary_key :id
      t.string :name
      t.text :body
      t.binary :photo
      t.datetime :upload_date
      t.boolean :public_flg

      t.timestamps
    end
  end

  def self.down
    drop_table :contributes
  end
end
