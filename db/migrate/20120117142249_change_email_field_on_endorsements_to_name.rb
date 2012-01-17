class ChangeEmailFieldOnEndorsementsToName < ActiveRecord::Migration
  def change
    rename_column :endorsements, :email, :name
  end
end
