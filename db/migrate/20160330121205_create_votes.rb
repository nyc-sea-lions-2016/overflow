class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true, index: true
      t.references :user, index: true

      t.timestamps null: false
       # validate uniqueness of user id
    end
  end
end
