class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :body
      t.belongs_to :answer
      t.belongs_to :user
      t.timestamps
    end
  end
end
