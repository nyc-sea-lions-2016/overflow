class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :question, index: true

      t. timestamps null: false
    end
  end
end
