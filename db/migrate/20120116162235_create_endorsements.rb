class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.integer :idea_id
      t.string  :email

      t.timestamps
    end
  end
end
