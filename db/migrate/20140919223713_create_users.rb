class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :password_salt # in BCrypt the salt is the beginning of the hash
      t.timestamps
    end
  end
end
